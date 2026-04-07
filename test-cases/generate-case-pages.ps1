# Script to generate all case study detail HTML pages

$cases = @(
  @{
    slug = "mortgage-technology"
    title = "Streamlining Mortgage Technology Operations"
    subtitle = "A Denver-based private FinTech company provides a digital mortgage platform serving banks, credit unions, and mortgage brokers."
    tags = @("FinTech", "Mortgage", "Back Office")
    customer = "Our client was a Denver-based private FinTech company specializing in digital mortgage platforms. The organization served banks, credit unions, and mortgage brokers across the United States. Rapid growth in loan origination volumes outpaced internal processing capacity. The operations team required scalable back-office support to sustain service commitments to financial institution partners."
    customer2 = "The client managed a high volume of loan documentation, compliance verification tasks, and borrower data processing requirements. Internal staff struggled to keep pace with demand. Turnaround times were extending beyond acceptable service level thresholds, placing existing client relationships at risk."
    challengeIntro = "The client's back-office operations were under significant strain due to exponential growth in digital mortgage applications. The absence of scalable processes created systemic quality and timing failures."
    challenges = @(
      @{ title = "Documentation volume"; body = "Loan processing document volumes exceeded internal team capacity by over 60%." }
      @{ title = "Data accuracy gaps"; body = "Inconsistent data validation across loan files led to recurring errors and rework cycles." }
      @{ title = "Turnaround delays"; body = "Processing delays frequently pushed beyond SLA thresholds, jeopardizing institutional client commitments." }
      @{ title = "Compliance exposure"; body = "Inadequate compliance verification workflows created regulatory risk across multiple state jurisdictions." }
      @{ title = "Integration gaps"; body = "Back-office processes were not fully integrated with the client's digital mortgage platform, creating manual handoffs." }
      @{ title = "Staff scalability"; body = "No scalable staffing model existed to absorb volume spikes without quality degradation." }
    )
    solutionIntro = "A dedicated processing team was deployed to assume end-to-end responsibility for mortgage document management. The engagement focused on workflow integration, quality assurance, and compliance alignment."
    solutions = @(
      @{ title = "End-to-end ownership"; body = "The team assumed complete responsibility for loan documentation intake, processing, and compliance verification." }
      @{ title = "Workflow integration"; body = "Back-office processes were seamlessly integrated with the client's existing digital mortgage platform." }
      @{ title = "Data validation framework"; body = "A structured data validation protocol eliminated recurring errors and reduced rework significantly." }
      @{ title = "Compliance verification"; body = "Systematic compliance checks were embedded at every stage of the loan processing workflow." }
      @{ title = "Scalable staffing model"; body = "A flexible team structure was established to absorb volume fluctuations without service disruption." }
      @{ title = "SLA management"; body = "Defined turnaround targets were met consistently through structured queue management and daily reporting." }
    )
    resultIntro = "The engagement delivered measurable improvements across processing speed, data accuracy, compliance adherence, and client growth capacity."
    results = @(
      @{ title = "Loan processing time"; body = "Processing cycle times reduced by 40%, consistently meeting institutional client SLA commitments." }
      @{ title = "Data accuracy"; body = "Loan file accuracy improved to 99.2%, eliminating costly rework and downstream corrections." }
      @{ title = "Client acquisition"; body = "Three new institutional clients were successfully onboarded within six months of engagement commencement." }
      @{ title = "Compliance error reduction"; body = "Compliance-related error rates declined by 85%, strengthening regulatory standing across jurisdictions." }
    )
    summary = "The engagement stabilized mortgage back-office operations by deploying an integrated processing team aligned with the client's digital platform. Loan file accuracy, turnaround speed, and compliance performance all improved substantially. The scalable staffing model positioned the client to onboard new institutional clients without operational disruption."
    summaryBullets = @("40% processing time reduction", "99.2% data accuracy", "3 new clients onboarded", "85% compliance error reduction")
    related = @(
      @{ text = "Optimizing High-Volume Transaction Operations"; href = "transaction-operations.html" }
      @{ text = "Financial Back Office Support Services"; href = "financial-back-office.html" }
      @{ text = "Financial Research Services"; href = "financial-research.html" }
    )
  }
  @{
    slug = "transaction-operations"
    title = "Optimizing High-Volume Transaction Operations"
    subtitle = "A mid-sized, fast-growing organization operating in a transaction-heavy environment partnered with Flatworld Solutions."
    tags = @("Finance", "Transactions", "Automation")
    customer = "Our client was a mid-sized, fast-growing organization operating in a transaction-heavy environment. Revenue and operations expanded faster than finance processes could scale. The accounting function struggled to keep pace with business growth. The finance team spent time correcting errors rather than supporting decision-making."
    customer2 = "The organization managed high transaction volumes across accounting, receivables, and payables. Month-end close cycles extended beyond standard timelines. Financial data lacked structure and was not audit-ready. Leadership required reliable financial information to support timely decision-making."
    challengeIntro = "The accounting operations were strained due to rapid business expansion. Finance processes failed to increase as rapidly as required, resulting in deteriorating data quality and operational pressure."
    challenges = @(
      @{ title = "Historical backlogs"; body = "Significant backlogs existed across bookkeeping, accounts receivable, and accounts payable." }
      @{ title = "Journal accuracy"; body = "Numerous journal entries contained errors and misclassifications affecting ledger accuracy." }
      @{ title = "AR controls"; body = "Accounts receivable lacked standardized controls and structured review mechanisms." }
      @{ title = "AP controls"; body = "Accounts payable workflows showed delays in posting and inconsistent vendor handling." }
      @{ title = "Cash visibility"; body = "Cash flow visibility remained unclear due to unreliable aging data." }
      @{ title = "Close timelines"; body = "Month-end close cycles extended between thirty and forty-five days." }
      @{ title = "Process standardization"; body = "No standardized accounting processes or documentation were in place." }
      @{ title = "Reporting stability"; body = "Management reports required frequent revisions due to inconsistent financial data." }
    )
    solutionIntro = "A structured transaction management workflow was implemented, assigning specialized teams for reconciliation, reporting, and exception handling, supported by robust QA processes."
    solutions = @(
      @{ title = "Complete ownership"; body = "The team assumed end-to-end responsibility for bookkeeping, receivables, payables, and ledger accuracy." }
      @{ title = "Backlog clearance"; body = "All historical backlogs across accounting, receivables, and payables were eliminated." }
      @{ title = "Financial cleanup"; body = "General ledger errors were corrected, balance sheet accounts reconciled, and unsupported balances removed." }
      @{ title = "Standardization"; body = "The Chart of Accounts and posting logic were standardized for consistency and reporting accuracy." }
      @{ title = "Process controls"; body = "Standardized workflows, defined ownership, weekly aging reviews, and pre-posting checks were implemented." }
      @{ title = "Close optimization"; body = "Month-end close reduced from 30–45 days to completion by the second week." }
    )
    resultIntro = "The engagement provided quantifiable benefits of accounting accuracy, process stability, and reporting reliability. Finance operations were streamlined, regulated, and made audit compliant."
    results = @(
      @{ title = "Transaction throughput"; body = "Transaction throughput increased by 55%, supporting business growth without headcount expansion." }
      @{ title = "Reporting accuracy"; body = "Reporting accuracy reached 99.5%, enabling reliable management decision-making." }
      @{ title = "Workload reduction"; body = "Internal team workload reduced by 60%, freeing capacity for higher-value strategic activities." }
      @{ title = "Cost savings"; body = "Cost savings of 35% achieved compared to in-house expansion alternative." }
    )
    summary = "The engagement stabilized accounting operations and cleared all historical backlogs. Ledger accuracy improved through cleanup and reconciliation. Standardized processes and stronger controls improved reporting reliability and shortened close timelines. The books became fully audit-ready, establishing a structured foundation for scalable finance operations and future automation."
    summaryBullets = @("55% throughput increase", "99.5% reporting accuracy", "60% workload reduction", "35% cost savings")
    related = @(
      @{ text = "Streamlining Mortgage Technology Operations"; href = "mortgage-technology.html" }
      @{ text = "Accounts Payable Services"; href = "accounts-payable.html" }
      @{ text = "Accounts Receivable Services"; href = "accounts-receivable.html" }
    )
  }
  @{
    slug = "ap-ar-scale"
    title = "Streamlining Accounts Payable and Receivable at Scale"
    subtitle = "A leading US-based distributor of industrial piping systems partnered with Flatworld Solutions to streamline its high-volume financial operations."
    tags = @("Manufacturing", "AP/AR", "Finance")
    customer = "Our client was a leading US-based distributor of industrial piping systems. The organization served a broad customer base across multiple industrial sectors. Expanding business volumes and tighter payment cycles placed significant pressure on accounts payable and receivable functions. Internal finance teams were unable to manage the growing workload without impacting service quality."
    customer2 = "The client operated an extensive vendor and customer network requiring consistent financial management. Manual invoice processing and scattered communications created recurring operational challenges. Cash flow visibility was limited, and supplier relationships were strained by payment inconsistencies."
    challengeIntro = "Manual processes, disconnected communications, and insufficient capacity created bottlenecks across the AP and AR functions, impacting cash flow and vendor relationships."
    challenges = @(
      @{ title = "Manual invoice processing"; body = "Invoice processing relied entirely on manual workflows, creating delays and error-prone outcomes." }
      @{ title = "Vendor communications"; body = "Scattered vendor communications led to duplicate payments, missed credits, and dispute escalations." }
      @{ title = "Delayed receivables"; body = "Delayed receivables created cash flow bottlenecks and constrained working capital availability." }
      @{ title = "Vendor relationship strain"; body = "Payment inconsistencies damaged vendor relationships critical to supply chain continuity." }
      @{ title = "Reconciliation backlog"; body = "Unreconciled AP and AR items accumulated, obscuring the true financial position of the business." }
      @{ title = "Month-end close delays"; body = "AP and AR backlogs consistently delayed month-end close activities and financial reporting." }
    )
    solutionIntro = "Standardized AP/AR workflows were implemented along with automated invoice matching and dedicated account managers for key vendor and customer relationships."
    solutions = @(
      @{ title = "Standardized workflows"; body = "End-to-end AP and AR workflows were standardized with clear ownership and defined processing steps." }
      @{ title = "Automated invoice matching"; body = "Invoice matching automation reduced manual touchpoints and eliminated duplicate payment risk." }
      @{ title = "Dedicated account management"; body = "Key vendor and customer accounts received dedicated managers to maintain relationship quality." }
      @{ title = "Dispute resolution framework"; body = "A structured dispute resolution process reduced open disputes and accelerated payment resolution." }
      @{ title = "Aging review cadence"; body = "Weekly aging reviews ensured timely follow-up on outstanding receivables and overdue payables." }
      @{ title = "Reporting visibility"; body = "Real-time AP and AR dashboards provided management with accurate cash flow visibility." }
    )
    resultIntro = "The standardized AP/AR operations produced significant improvements in processing speed, cash flow management, and vendor relationship stability."
    results = @(
      @{ title = "Invoice processing time"; body = "Invoice processing time cut by 50%, accelerating payment cycles across the vendor network." }
      @{ title = "Days Sales Outstanding"; body = "DSO reduced by 18 days, improving working capital and cash flow predictability." }
      @{ title = "Vendor payment disputes"; body = "Vendor payment disputes reduced by 70%, strengthening key supply chain relationships." }
      @{ title = "Month-end close"; body = "Month-end close accelerated by 4 days, enabling earlier financial reporting to leadership." }
    )
    summary = "The engagement transformed AP and AR operations through workflow standardization, automation, and dedicated account management. Processing speed, cash flow visibility, and vendor relationship quality all improved substantially. The accelerated month-end close supported more timely and accurate financial reporting."
    summaryBullets = @("50% faster invoice processing", "18-day DSO reduction", "70% fewer vendor disputes", "4-day close acceleration")
    related = @(
      @{ text = "Accounts Payable Services"; href = "accounts-payable.html" }
      @{ text = "Accounts Receivable Services"; href = "accounts-receivable.html" }
      @{ text = "Optimizing High-Volume Transaction Operations"; href = "transaction-operations.html" }
    )
  }
  @{
    slug = "cpa-bookkeeping"
    title = "Boosting Bookkeeping Efficiency for a CPA & CFO Firm"
    subtitle = "A well-established CPA firm offering high-end CFO and Tax services sought Flatworld Solutions' support to enhance its bookkeeping operations."
    tags = @("CPA", "Bookkeeping", "CFO Services")
    customer = "Our client was a well-established CPA firm offering high-end CFO and Tax services to mid-market businesses. The firm had built a strong reputation for strategic advisory work but faced growing capacity constraints within its bookkeeping function. Senior staff were increasingly absorbed in routine tasks rather than high-value advisory engagements."
    customer2 = "The firm served a diverse client base requiring accurate, timely bookkeeping as a foundation for CFO advisory services. Internal bookkeepers were overwhelmed with reconciliation and data entry volumes. The firm needed a reliable outsourcing partner to handle routine operations while preserving quality and client confidentiality."
    challengeIntro = "Routine bookkeeping demands consumed senior staff capacity, limiting the firm's ability to deliver high-value advisory services and onboard new clients."
    challenges = @(
      @{ title = "Senior staff overload"; body = "Bookkeepers and senior CPAs spent excessive time on routine reconciliation and data entry tasks." }
      @{ title = "Capacity constraints"; body = "Insufficient capacity prevented the firm from accepting new advisory clients despite strong market demand." }
      @{ title = "Revenue opportunity cost"; body = "Time spent on routine bookkeeping displaced higher-revenue CFO advisory and tax planning work." }
      @{ title = "Turnaround pressure"; body = "Client deliverable timelines were at risk due to bookkeeping backlogs and staffing limitations." }
      @{ title = "Software complexity"; body = "Managing multiple client environments across QuickBooks and Xero platforms strained internal resources." }
      @{ title = "Error exposure"; body = "Rushed processing under capacity pressure increased the risk of errors in client financial statements." }
    )
    solutionIntro = "A dedicated bookkeeping team familiar with US GAAP standards was deployed to handle routine reconciliations, payroll entries, and financial statement preparation across the firm's client base."
    solutions = @(
      @{ title = "Dedicated bookkeeping team"; body = "A specialized team was assigned to handle all routine bookkeeping tasks across the firm's client portfolio." }
      @{ title = "US GAAP alignment"; body = "All work was performed in strict accordance with US GAAP standards and the firm's internal quality protocols." }
      @{ title = "Multi-platform expertise"; body = "The team operated across both QuickBooks and Xero, maintaining consistent workflows across client environments." }
      @{ title = "Payroll entry management"; body = "Payroll journal entries were prepared accurately and on schedule across all client accounts." }
      @{ title = "Financial statement preparation"; body = "Monthly and quarterly financial statements were delivered with verified accuracy and within agreed timelines." }
      @{ title = "Quality assurance"; body = "A structured QA process ensured all deliverables met the firm's accuracy and presentation standards." }
    )
    resultIntro = "The engagement freed senior staff capacity, accelerated deliverable timelines, and enabled the firm to expand its advisory client base."
    results = @(
      @{ title = "Senior CPA time freed"; body = "Senior CPA time freed by 30 hours per week, redirected to high-value advisory and client development." }
      @{ title = "Bookkeeping turnaround"; body = "Bookkeeping turnaround cut by 45%, ensuring timely delivery of all client financial deliverables." }
      @{ title = "Client capacity"; body = "Client onboarding capacity increased by 40%, directly supporting firm revenue growth." }
      @{ title = "Error rate reduction"; body = "Error rate in financial statements reduced by 90%, strengthening client confidence and firm reputation." }
    )
    summary = "The engagement relieved capacity pressure on senior CPA staff by deploying a reliable, GAAP-aligned bookkeeping team. Turnaround times improved, error rates declined, and the firm gained the capacity to onboard additional advisory clients. The partnership supported both operational quality and business growth objectives."
    summaryBullets = @("30 hours/week senior time freed", "45% faster turnaround", "40% more client capacity", "90% error rate reduction")
    related = @(
      @{ text = "Financial Back Office Support Services"; href = "financial-back-office.html" }
      @{ text = "Accounts Payable Services"; href = "accounts-payable.html" }
      @{ text = "Billing Services"; href = "billing-services.html" }
    )
  }
  @{
    slug = "accounts-payable"
    title = "Accounts Payable Services"
    subtitle = "Flatworld established a cash flow system for the customer to regulate the processing of transaction documents including invoices, proof of delivery, and bills of lading."
    tags = @("AP Services", "Cash Flow", "Documents")
    customer = "Our client was a growing logistics company managing a high volume of supplier transactions across multiple distribution channels. The organization processed significant quantities of transaction documents daily, including invoices, proofs of delivery, and bills of lading. The accounts payable function lacked the structured processes required to handle this volume efficiently."
    customer2 = "Supplier payment obligations were critical to maintaining supply chain continuity. Document processing backlogs had accumulated over several months, creating reconciliation challenges and damaging vendor relationships. The finance team required immediate structural intervention to restore operational stability."
    challengeIntro = "Unstructured document processing workflows and accumulated backlogs created significant cash flow and vendor relationship challenges across the AP function."
    challenges = @(
      @{ title = "Document processing backlog"; body = "Months of unprocessed transaction documents created unresolvable reconciliation challenges." }
      @{ title = "Inconsistent workflows"; body = "No standardized intake or validation process existed for the various document types received daily." }
      @{ title = "Supplier payment delays"; body = "Payment delays strained key vendor relationships critical to supply chain operations." }
      @{ title = "Audit trail gaps"; body = "Insufficient documentation trails created compliance exposure during internal and external reviews." }
      @{ title = "Cash flow opacity"; body = "Unprocessed payables obscured the true cash flow position, complicating treasury management decisions." }
      @{ title = "High processing cost"; body = "Manual, ad-hoc document handling resulted in excessive per-document processing costs." }
    )
    solutionIntro = "A dedicated AP team was deployed to design an end-to-end document intake, validation, and processing system with custom checklists and SLAs for each document type."
    solutions = @(
      @{ title = "End-to-end document system"; body = "A complete document intake, validation, and processing system was designed and implemented from the ground up." }
      @{ title = "Standardized checklists"; body = "Custom processing checklists were created for each transaction document type to ensure consistent handling." }
      @{ title = "SLA establishment"; body = "Defined service level agreements for each document category ensured predictable processing timelines." }
      @{ title = "Backlog clearance"; body = "The accumulated document processing backlog was systematically cleared within 30 days of engagement commencement." }
      @{ title = "Audit trail compliance"; body = "A complete and traceable audit trail was established for all processed documents." }
      @{ title = "Supplier payment standardization"; body = "Supplier payment cycles were standardized to net-15 terms across all vendor categories." }
    )
    resultIntro = "The AP restructuring delivered rapid backlog resolution, standardized payment cycles, and significant cost improvements across all document processing categories."
    results = @(
      @{ title = "Backlog cleared"; body = "Document processing backlog cleared within 30 days, restoring operational stability across the AP function." }
      @{ title = "Payment cycle standardization"; body = "Supplier payment cycle standardized to net-15, strengthening vendor relationships and supply chain reliability." }
      @{ title = "Audit trail compliance"; body = "100% document audit trail compliance achieved, eliminating compliance exposure." }
      @{ title = "Processing cost reduction"; body = "Processing cost per document reduced by 42%, significantly improving AP operational efficiency." }
    )
    summary = "The engagement restructured the client's accounts payable function through a purpose-built document processing system. The backlog was cleared rapidly, supplier payment cycles standardized, and processing costs reduced substantially. Full audit trail compliance provided ongoing protection during financial reviews."
    summaryBullets = @("30-day backlog clearance", "Net-15 payment cycle", "100% audit trail compliance", "42% cost per document reduction")
    related = @(
      @{ text = "Accounts Receivable Services"; href = "accounts-receivable.html" }
      @{ text = "Streamlining AP and AR at Scale"; href = "ap-ar-scale.html" }
      @{ text = "Billing Services"; href = "billing-services.html" }
    )
  }
  @{
    slug = "accounts-receivable"
    title = "Accounts Receivable Services"
    subtitle = "Flatworld Solutions addressed the accounts receivable and claims management needs of two small-sized companies struggling with cash inflows and disputed claims."
    tags = @("AR Services", "Claims Management", "SMB")
    customer = "Our clients were two small-sized companies operating in service-oriented sectors. Both organizations lacked dedicated accounts receivable teams, resulting in increasingly aged receivables and unresolved claims. Cash inflows were inconsistent, creating working capital strain that affected day-to-day operations."
    customer2 = "The companies required a reliable AR partner capable of implementing structured follow-up processes, managing disputed claims, and providing real-time visibility into receivables performance. A cost-effective shared service model was identified as the appropriate solution given the scale of both organizations."
    challengeIntro = "The absence of dedicated AR resources led to aging receivables, unresolved disputes, and deteriorating working capital positions at both client organizations."
    challenges = @(
      @{ title = "Aging receivables"; body = "Receivables aging well beyond standard terms without structured follow-up or escalation protocols." }
      @{ title = "Missed follow-ups"; body = "No systematic follow-up schedule existed for outstanding invoices, allowing debtors to delay payment." }
      @{ title = "Unresolved claims"; body = "Disputed claims accumulated without resolution, creating write-off risk and cash flow uncertainty." }
      @{ title = "Working capital impact"; body = "Delayed collections directly constrained working capital and limited operational investment capacity." }
      @{ title = "Reporting limitations"; body = "No real-time AR reporting existed, preventing management from understanding the true receivables position." }
      @{ title = "Bad debt exposure"; body = "Extended aging without intervention increased the probability of bad debt write-offs." }
    )
    solutionIntro = "A shared AR team was deployed to serve both clients, implementing structured follow-up schedules, dispute resolution workflows, and real-time AR dashboards for management visibility."
    solutions = @(
      @{ title = "Shared AR team model"; body = "A cost-effective shared team structure served both clients with dedicated attention to each account portfolio." }
      @{ title = "Structured follow-up schedule"; body = "A systematic follow-up cadence was established for all outstanding invoices across aging brackets." }
      @{ title = "Dispute resolution workflow"; body = "A formal dispute resolution process was implemented to resolve claims efficiently and protect revenue." }
      @{ title = "Real-time AR dashboards"; body = "Management dashboards provided live visibility into receivables performance, aging, and collection trends." }
      @{ title = "Escalation protocols"; body = "Clear escalation pathways were defined for high-value or persistently overdue accounts." }
      @{ title = "Bad debt prevention"; body = "Proactive follow-up and early dispute resolution significantly reduced the risk of uncollectable balances." }
    )
    resultIntro = "The shared AR engagement produced substantial improvements in collection speed, claims resolution, and combined cost efficiency for both client organizations."
    results = @(
      @{ title = "Collection period reduction"; body = "Average collection period reduced by 22 days across both client portfolios." }
      @{ title = "Claims resolution rate"; body = "Claims resolution rate improved to 94%, protecting revenue and reducing write-off risk." }
      @{ title = "Bad debt reduction"; body = "Bad debt write-offs reduced by 60%, directly improving the financial stability of both organizations." }
      @{ title = "Combined cost savings"; body = "Combined annual cost savings of \$180K achieved through the shared service delivery model." }
    )
    summary = "The shared AR engagement delivered structured collection processes and dispute resolution capability to two organizations previously lacking dedicated receivables management. Collection periods shortened dramatically, claims resolution improved, and bad debt exposure declined significantly. The shared model provided enterprise-quality AR services at a cost appropriate for smaller organizations."
    summaryBullets = @("22-day collection period reduction", "94% claims resolution rate", "60% bad debt reduction", "\$180K combined annual savings")
    related = @(
      @{ text = "Accounts Payable Services"; href = "accounts-payable.html" }
      @{ text = "Streamlining AP and AR at Scale"; href = "ap-ar-scale.html" }
      @{ text = "Billing Services"; href = "billing-services.html" }
    )
  }
  @{
    slug = "billing-services"
    title = "Billing Services"
    subtitle = "Flatworld Solutions provided comprehensive billing back office support to a law firm, managing all paperwork from case initiation through final invoicing."
    tags = @("Legal", "Billing", "Back Office")
    customer = "Our client was an established law firm managing a diverse caseload across multiple practice areas. The firm's billing function was overwhelmed by complex multi-matter billing requirements, inconsistent time entry practices, and high rates of invoice revisions. Senior attorneys were spending valuable time on billing administration rather than client-facing legal work."
    customer2 = "The firm required a billing support partner with expertise in legal billing standards, LEDES invoice formats, and e-billing submission platforms. Delays in invoicing were extending revenue realization timelines and creating friction in client relationships. A structured back-office billing team was needed to restore operational discipline."
    challengeIntro = "Complex multi-matter billing, inconsistent time entry practices, and high invoice revision rates were delaying revenue realization and straining client relationships."
    challenges = @(
      @{ title = "Multi-matter complexity"; body = "Complex multi-matter billing across diverse practice areas overwhelmed the internal billing team." }
      @{ title = "Inconsistent time entry"; body = "Attorneys applied inconsistent time entry practices, creating review and correction burdens downstream." }
      @{ title = "High invoice rejection rate"; body = "An 18% invoice rejection rate from clients generated significant rework and delayed revenue recognition." }
      @{ title = "Billing administration burden"; body = "Attorneys spent excessive time on billing administration, reducing capacity for billable legal work." }
      @{ title = "Revenue realization delays"; body = "Extended billing cycles delayed revenue realization and created cash flow uncertainty for the firm." }
      @{ title = "E-billing platform complexity"; body = "Managing e-billing submissions across multiple client platforms required specialized expertise not available internally." }
    )
    solutionIntro = "A specialized legal billing team was assigned to manage time entry review, LEDES invoice preparation, expense verification, and e-billing submissions across the firm's major client accounts."
    solutions = @(
      @{ title = "Specialized legal billing team"; body = "A team with legal billing expertise was assigned to manage the firm's complete billing function." }
      @{ title = "Time entry review"; body = "All attorney time entries were reviewed and standardized before invoice preparation to minimize rejections." }
      @{ title = "LEDES invoice preparation"; body = "LEDES-compliant invoices were prepared accurately and submitted on schedule for all applicable clients." }
      @{ title = "Expense verification"; body = "All billable expenses were verified against supporting documentation prior to inclusion in invoices." }
      @{ title = "E-billing submissions"; body = "E-billing submissions were managed across all required client platforms with full compliance tracking." }
      @{ title = "Process documentation"; body = "Billing procedures were documented to ensure consistency and enable quality control at each stage." }
    )
    resultIntro = "The billing engagement produced dramatic improvements in invoice quality, revenue realization speed, and attorney time efficiency across the firm."
    results = @(
      @{ title = "Invoice rejection rate"; body = "Invoice rejection rate reduced from 18% to 2%, dramatically reducing rework and improving client satisfaction." }
      @{ title = "Billing realization rate"; body = "Billing realization rate improved by 12 percentage points, increasing effective revenue capture." }
      @{ title = "Days to invoice"; body = "Average days to invoice reduced from 45 to 14 days, accelerating cash flow significantly." }
      @{ title = "Attorney billing admin time"; body = "Attorney time spent on billing administration cut by 80%, redirected to billable client work." }
    )
    summary = "The engagement transformed the firm's billing function through specialized legal billing expertise and disciplined process management. Invoice rejection rates fell sharply, realization improved, and revenue was recognized significantly faster. Attorneys regained substantial time previously consumed by billing administration."
    summaryBullets = @("18% to 2% rejection rate", "12-point realization improvement", "45 to 14 days to invoice", "80% admin time reduction")
    related = @(
      @{ text = "Accounts Payable Services"; href = "accounts-payable.html" }
      @{ text = "Accounts Receivable Services"; href = "accounts-receivable.html" }
      @{ text = "Boosting Bookkeeping Efficiency for a CPA Firm"; href = "cpa-bookkeeping.html" }
    )
  }
  @{
    slug = "equity-research"
    title = "Equity Research Services"
    subtitle = "Flatworld provided equity research services to identify investment policies capable of delivering strong returns even during stock market downturns."
    tags = @("Equity Research", "Finance", "Investment")
    customer = "Our client was a financial advisory firm serving high-net-worth individuals and institutional investors. The firm required expanded equity research capability to identify counter-cyclical investment opportunities capable of protecting and growing client portfolios during volatile market periods. Internal research coverage was insufficient for the analytical depth required."
    customer2 = "The client needed a research partner capable of conducting rigorous fundamental and quantitative analysis across a broad universe of equities. Strategic recommendations needed to be grounded in verified data and aligned with risk parameters appropriate for the firm's client portfolios."
    challengeIntro = "Limited internal research capacity and insufficient equity coverage prevented the firm from identifying and capitalizing on counter-cyclical investment opportunities."
    challenges = @(
      @{ title = "Insufficient research coverage"; body = "Internal research coverage was limited to 50 equities, inadequate for the breadth of analysis required." }
      @{ title = "Counter-cyclical framework absent"; body = "No robust framework existed for identifying equities likely to outperform in bear market conditions." }
      @{ title = "Quantitative analysis gaps"; body = "Internal teams lacked the quantitative modeling resources required for rigorous equity screening." }
      @{ title = "Turnaround speed"; body = "Research turnaround times were too slow to capitalize on time-sensitive market conditions." }
      @{ title = "Sector diversification"; body = "Research was concentrated in a narrow range of sectors, creating portfolio vulnerability." }
      @{ title = "Data reliability"; body = "Inconsistent data sourcing undermined confidence in research conclusions and client recommendations." }
    )
    solutionIntro = "Flatworld's research team conducted deep fundamental and quantitative analysis across multiple sectors, identifying defensive stocks, dividend aristocrats, and alternative assets suitable for down-market conditions."
    solutions = @(
      @{ title = "Expanded equity universe"; body = "Research coverage was expanded from 50 to over 200 equities across defensive and counter-cyclical sectors." }
      @{ title = "Fundamental analysis"; body = "Deep fundamental analysis was conducted on all covered equities with standardized financial modeling frameworks." }
      @{ title = "Quantitative screening"; body = "Quantitative screening models identified equities with characteristics aligned to bear market outperformance." }
      @{ title = "Sector diversification"; body = "Coverage was extended across multiple defensive sectors to provide well-rounded portfolio recommendations." }
      @{ title = "Alternative asset identification"; body = "Alternative assets including dividend aristocrats and defensive real assets were incorporated into research output." }
      @{ title = "Accelerated turnaround"; body = "Structured research processes significantly reduced the time from analysis initiation to client-ready report delivery." }
    )
    resultIntro = "The equity research engagement substantially expanded coverage capacity, improved analytical quality, and directly supported portfolio outperformance during a challenging market period."
    results = @(
      @{ title = "Research coverage expansion"; body = "Research coverage expanded from 50 to over 200 equities, providing a broad analytical foundation." }
      @{ title = "Investment opportunities"; body = "12 counter-cyclical investment opportunities were identified and recommended to the client." }
      @{ title = "Portfolio performance"; body = "Client portfolio outperformed benchmark by 8% during the bear market period covered by the engagement." }
      @{ title = "Research turnaround"; body = "Research turnaround time improved by 65%, enabling more timely advisory recommendations." }
    )
    summary = "The engagement provided the financial advisory firm with the research depth and analytical rigor required to build resilient, counter-cyclical investment strategies. Coverage expanded dramatically, turnaround improved, and client portfolios demonstrated meaningful outperformance during a challenging market environment."
    summaryBullets = @("200+ equities covered", "12 counter-cyclical opportunities identified", "8% benchmark outperformance", "65% turnaround improvement")
    related = @(
      @{ text = "Financial Research Services"; href = "financial-research.html" }
      @{ text = "Financial Back Office Support Services"; href = "financial-back-office.html" }
      @{ text = "Boosting Bookkeeping Efficiency for a CPA Firm"; href = "cpa-bookkeeping.html" }
    )
  }
  @{
    slug = "financial-back-office"
    title = "Financial Back Office Support Services"
    subtitle = "Flatworld's Finance and Accounting Services department processed large volumes of loan applications for a Bank Loan Production Office, assessing eligibility and preparing documentation."
    tags = @("Banking", "Loan Processing", "Documentation")
    customer = "Our client was a bank operating a Loan Production Office serving a regional market. The office experienced a significant surge in loan application volumes driven by favorable interest rate conditions. Internal processing capacity was insufficient to manage the volume while maintaining required turnaround standards and documentation quality."
    customer2 = "The bank required a processing partner capable of managing the complete loan application lifecycle, from initial intake through eligibility assessment and documentation package assembly. Accuracy, compliance, and confidentiality were non-negotiable requirements given the regulated nature of the engagement."
    challengeIntro = "High application volumes exceeded internal processing capacity, creating delays that affected customer satisfaction and the bank's competitive positioning."
    challenges = @(
      @{ title = "Volume surge"; body = "Loan application volumes surged beyond internal processing capacity, creating significant backlogs." }
      @{ title = "Eligibility assessment delays"; body = "Insufficient analyst resources slowed eligibility assessments, delaying application-to-decision timelines." }
      @{ title = "Documentation complexity"; body = "Each application required comprehensive documentation packages compiled from multiple data sources." }
      @{ title = "Accuracy requirements"; body = "Regulatory standards required near-perfect accuracy in all loan documentation and eligibility assessments." }
      @{ title = "Customer satisfaction impact"; body = "Processing delays were directly affecting borrower satisfaction and damaging the bank's market reputation." }
      @{ title = "Compliance exposure"; body = "Rushed processing under volume pressure increased the risk of documentation errors and compliance failures." }
    )
    solutionIntro = "A team of financial analysts and documentation specialists was deployed to manage the complete loan application lifecycle from initial intake through final documentation package assembly."
    solutions = @(
      @{ title = "Dedicated processing team"; body = "Financial analysts and documentation specialists were deployed to manage all loan application processing." }
      @{ title = "Complete lifecycle management"; body = "The team assumed ownership of the full application lifecycle from intake to documentation assembly." }
      @{ title = "Eligibility scoring"; body = "Structured eligibility assessment frameworks were applied consistently across all applications." }
      @{ title = "Documentation assembly"; body = "Complete, compliant documentation packages were assembled for all eligible applications." }
      @{ title = "Quality assurance"; body = "A rigorous QA process ensured documentation accuracy and compliance with regulatory requirements." }
      @{ title = "Scalable capacity model"; body = "Team capacity was structured to absorb volume fluctuations without service quality degradation." }
    )
    resultIntro = "The engagement dramatically expanded loan processing capacity, accelerated decision timelines, and maintained exceptional documentation accuracy throughout."
    results = @(
      @{ title = "Processing capacity"; body = "Loan processing capacity increased by 70%, enabling the bank to manage the volume surge without service disruption." }
      @{ title = "Application-to-decision time"; body = "Application-to-decision time reduced from 21 to 7 days, improving competitive positioning and borrower satisfaction." }
      @{ title = "Documentation error rate"; body = "Documentation error rate maintained below 0.5%, satisfying all regulatory accuracy requirements." }
      @{ title = "Customer satisfaction"; body = "Customer satisfaction scores improved by 28 points, reflecting the improved processing speed and quality." }
    )
    summary = "The engagement provided the bank with the processing capacity, analytical expertise, and quality control framework required to manage a significant application volume surge. Decision timelines shortened dramatically, documentation accuracy was maintained at regulatory standards, and customer satisfaction improved measurably."
    summaryBullets = @("70% capacity increase", "21 to 7 days decision time", "Below 0.5% error rate", "28-point satisfaction improvement")
    related = @(
      @{ text = "Streamlining Mortgage Technology Operations"; href = "mortgage-technology.html" }
      @{ text = "Financial Research Services"; href = "financial-research.html" }
      @{ text = "Equity Research Services"; href = "equity-research.html" }
    )
  }
  @{
    slug = "financial-research"
    title = "Financial Research Services"
    subtitle = "Flatworld Solutions supported multiple small companies through the complex process of preparing financial data for Securities and Exchange Commission (SEC) filing compliance."
    tags = @("SEC Filing", "Research", "Compliance")
    customer = "Our clients were multiple small companies required to file financial disclosures with the Securities and Exchange Commission. Each organization lacked the internal expertise and resources required to compile accurate, compliant financial data packages. Regulatory filing deadlines created significant pressure on management teams unfamiliar with SEC reporting standards."
    customer2 = "The clients required a research and documentation partner with deep familiarity with SEC EDGAR requirements and financial reporting standards. Zero-tolerance for errors was essential, as inaccurate filings carried the potential for regulatory penalties and reputational consequences."
    challengeIntro = "Insufficient internal expertise and resources placed the companies at risk of SEC filing delays, inaccuracies, and associated regulatory penalties."
    challenges = @(
      @{ title = "SEC expertise gap"; body = "Clients lacked internal knowledge of SEC EDGAR submission requirements and financial disclosure standards." }
      @{ title = "Data accuracy requirements"; body = "SEC filings required exceptional data accuracy with no tolerance for errors or omissions." }
      @{ title = "Filing deadline pressure"; body = "Regulatory deadlines created significant pressure on management teams unequipped to manage the process internally." }
      @{ title = "Disclosure breadth"; body = "Required disclosures spanned multiple financial statements and supporting schedules requiring comprehensive data gathering." }
      @{ title = "Resource limitations"; body = "Small company resource constraints prevented investment in the specialized expertise required for SEC compliance." }
      @{ title = "Penalty exposure"; body = "Filing delays or inaccuracies carried the risk of regulatory penalties and potential reputational damage." }
    )
    solutionIntro = "Flatworld's financial research team conducted detailed data gathering, normalization, and analysis, preparing complete financial disclosure packages aligned with SEC EDGAR submission requirements."
    solutions = @(
      @{ title = "Data gathering and normalization"; body = "Comprehensive financial data was gathered from multiple sources, normalized, and verified for accuracy." }
      @{ title = "SEC EDGAR alignment"; body = "All disclosure packages were prepared in strict accordance with SEC EDGAR formatting and content requirements." }
      @{ title = "Multi-statement preparation"; body = "Complete financial statement packages including income statements, balance sheets, and supporting schedules were prepared." }
      @{ title = "Accuracy verification"; body = "Multi-layer verification processes ensured financial data accuracy at the 99.8% level." }
      @{ title = "Deadline management"; body = "Structured timelines ensured all filings were completed and submitted ahead of regulatory deadlines." }
      @{ title = "Client advisory support"; body = "Clients received guidance on disclosure requirements and financial reporting obligations throughout the engagement." }
    )
    resultIntro = "The engagement delivered 100% on-time SEC filing compliance across all client organizations, with zero regulatory penalties and significantly reduced per-filing costs."
    results = @(
      @{ title = "Filing compliance rate"; body = "100% on-time SEC filing rate achieved across all client organizations throughout the engagement." }
      @{ title = "Regulatory penalties"; body = "Zero regulatory penalties incurred post-engagement, reflecting complete compliance with SEC requirements." }
      @{ title = "Data accuracy"; body = "Financial data accuracy verified at 99.8%, meeting the exceptional standards required for regulatory filings." }
      @{ title = "Cost per filing"; body = "Average cost per filing reduced by 55% compared to the Big-4 alternative previously used by clients." }
    )
    summary = "The engagement provided small companies with the specialized SEC filing expertise required to meet regulatory obligations accurately and on time. Zero penalties were incurred across all filings, and the cost-to-compliance ratio improved dramatically compared to the previous approach. Clients gained confidence in their regulatory standing and financial disclosure processes."
    summaryBullets = @("100% on-time filing rate", "Zero regulatory penalties", "99.8% data accuracy", "55% cost reduction vs Big-4")
    related = @(
      @{ text = "Equity Research Services"; href = "equity-research.html" }
      @{ text = "Financial Back Office Support Services"; href = "financial-back-office.html" }
      @{ text = "Boosting Bookkeeping Efficiency for a CPA Firm"; href = "cpa-bookkeeping.html" }
    )
  }
)

# ─── HTML template function ───────────────────────────────────────────────────
function Get-CheckItem($item) {
  return @"
        <li>
          <div><strong>$($item.title):</strong> $($item.body)</div>
        </li>
"@
}

function Get-BulletItem($text) {
  return "        <li>$text</li>`n"
}

function Get-RelatedLink($rel) {
  return @"
    <a class="related-link" href="$($rel.href)">
      $($rel.text)
      <span class="arrow">&#8594;</span>
    </a>
"@
}

function Build-CasePage($c) {
  $challengeItems = ($c.challenges | ForEach-Object { Get-CheckItem $_ }) -join ""
  $solutionItems  = ($c.solutions  | ForEach-Object { Get-CheckItem $_ }) -join ""
  $resultItems    = ($c.results    | ForEach-Object { Get-CheckItem $_ }) -join ""
  $summaryBullets = ($c.summaryBullets | ForEach-Object { Get-BulletItem $_ }) -join ""
  $relatedLinks   = ($c.related    | ForEach-Object { Get-RelatedLink $_ }) -join ""
  $tagsHtml       = ($c.tags | ForEach-Object { "<span class=`"tag-badge`">$_</span>" }) -join " "

  return @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$($c.title) | AI Finora Case Studies</title>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    font-family: 'Open Sans', sans-serif;
    font-size: 13px;
    color: #333;
    background: #fff;
  }

  /* ── HERO ── */
  .hero {
    background: linear-gradient(rgba(0,0,0,0.58), rgba(0,0,0,0.58)),
                url('https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=1400&q=80') center/cover no-repeat;
    min-height: 170px;
    display: flex;
    align-items: flex-end;
    padding: 30px 40px 24px;
  }
  .hero-inner { max-width: 960px; width: 100%; }
  .hero-back {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: rgba(255,255,255,0.85);
    text-decoration: none;
    font-size: 12px;
    margin-bottom: 12px;
    padding: 5px 12px;
    border: 1px solid rgba(255,255,255,0.4);
    border-radius: 4px;
    transition: background 0.2s;
  }
  .hero-back:hover { background: rgba(255,255,255,0.15); }
  .hero h1 {
    color: #fff;
    font-size: 26px;
    font-weight: 700;
    line-height: 1.35;
    max-width: 720px;
  }
  .hero-tags { display: flex; gap: 8px; flex-wrap: wrap; margin-top: 12px; }
  .tag-badge {
    background: rgba(255,255,255,0.18);
    border: 1px solid rgba(255,255,255,0.4);
    color: #fff;
    font-size: 11px;
    padding: 3px 10px;
    border-radius: 20px;
  }

  /* ── RED FORM BAR ── */
  .form-bar {
    background: #c0392b;
    padding: 14px 30px;
    display: flex;
    align-items: flex-start;
    gap: 10px;
    flex-wrap: wrap;
  }
  .form-bar-label { color: #fff; font-size: 13px; font-weight: 700; min-width: 130px; line-height: 1.4; }
  .form-bar-label span { display: block; font-size: 11px; font-weight: 400; }
  .form-bar input[type="text"] { height: 30px; border: none; padding: 0 10px; font-size: 12px; min-width: 110px; flex: 1; background: #fff; }
  .form-bar textarea { height: 42px; border: none; padding: 6px 10px; font-size: 12px; min-width: 160px; flex: 2; resize: none; background: #fff; }
  .captcha-box { display: flex; align-items: center; background: #fff; padding: 4px 8px; font-size: 13px; font-weight: 700; gap: 6px; height: 30px; letter-spacing: 2px; }
  .btn-submit { background: #333; color: #fff; border: none; padding: 0 18px; height: 30px; font-size: 12px; font-weight: 700; cursor: pointer; text-transform: uppercase; letter-spacing: 1px; }
  .privacy-link { font-size: 10px; color: #ffcccc; text-decoration: underline; cursor: pointer; align-self: flex-end; }

  /* ── BREADCRUMB ── */
  .breadcrumb { padding: 8px 30px; font-size: 11px; color: #666; border-bottom: 1px solid #eee; }
  .breadcrumb a { color: #c0392b; text-decoration: none; }
  .breadcrumb a:hover { text-decoration: underline; }
  .breadcrumb span { color: #999; margin: 0 4px; }

  /* ── MAIN LAYOUT ── */
  .page-body { max-width: 980px; margin: 0 auto; padding: 28px 20px; display: flex; gap: 30px; align-items: flex-start; }
  .main-content { flex: 1; min-width: 0; }
  .sidebar { width: 220px; flex-shrink: 0; }

  /* ── SECTION HEADINGS ── */
  .section-title { color: #c0392b; font-size: 20px; font-weight: 700; margin-bottom: 12px; font-family: 'Roboto', sans-serif; }

  /* ── CUSTOMER ── */
  .customer-section { margin-bottom: 28px; }
  .customer-section p { line-height: 1.7; margin-bottom: 10px; color: #444; font-size: 13px; }

  /* ── CARD BOXES ── */
  .card-box { background: #f9f9f9; border: 1px solid #eee; padding: 22px 26px; margin-bottom: 28px; }
  .card-box .section-title { margin-bottom: 10px; }
  .card-box > p { color: #444; line-height: 1.7; margin-bottom: 14px; font-size: 13px; }

  .check-list { list-style: none; padding: 0; }
  .check-list li { display: flex; align-items: flex-start; gap: 8px; padding: 5px 0; font-size: 13px; color: #333; line-height: 1.55; }
  .check-list li::before {
    content: '';
    display: inline-block;
    width: 14px; height: 14px; min-width: 14px;
    border-radius: 50%;
    background: #c0392b url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12'%3E%3Cpath d='M2 6l3 3 5-5' stroke='white' stroke-width='1.8' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E") center/10px no-repeat;
    margin-top: 2px;
  }
  .check-list li strong { font-weight: 700; }

  /* ── RESULT / SUMMARY ── */
  .result-section { margin-bottom: 28px; }
  .summary-section { margin-bottom: 20px; }
  .summary-section p { color: #444; line-height: 1.7; margin-bottom: 14px; font-size: 13px; }
  .summary-bullets { list-style: none; padding: 0; margin-bottom: 14px; }
  .summary-bullets li { display: flex; align-items: flex-start; gap: 8px; padding: 4px 0; font-size: 13px; color: #333; }
  .summary-bullets li::before {
    content: '';
    display: inline-block;
    width: 14px; height: 14px; min-width: 14px;
    border-radius: 50%;
    background: #c0392b url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12'%3E%3Cpath d='M2 6l3 3 5-5' stroke='white' stroke-width='1.8' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E") center/10px no-repeat;
    margin-top: 2px;
  }
  .cta-text { font-size: 13px; color: #444; margin-top: 8px; }
  .cta-text a { color: #c0392b; font-weight: 600; text-decoration: none; }
  .cta-text a:hover { text-decoration: underline; }

  /* ── SIDEBAR ── */
  .sidebar-title { font-size: 16px; font-weight: 700; color: #c0392b; margin-bottom: 14px; font-family: 'Roboto', sans-serif; }
  .related-link { display: flex; align-items: center; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #eee; text-decoration: none; color: #333; font-size: 12.5px; line-height: 1.4; gap: 8px; }
  .related-link:hover { color: #c0392b; }
  .related-link .arrow { color: #c0392b; font-size: 16px; flex-shrink: 0; }
  .btn-more { display: inline-block; background: #c0392b; color: #fff; text-decoration: none; padding: 9px 18px; font-size: 12px; font-weight: 700; margin-top: 16px; border-radius: 2px; }
  .btn-more:hover { background: #a93226; }
  .contact-box { margin-top: 20px; background: linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.55)), url('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&q=80') center/cover no-repeat; padding: 30px 18px; text-align: center; border-radius: 2px; }
  .contact-box p { color: #fff; font-size: 14px; font-weight: 700; line-height: 1.4; margin-bottom: 12px; }
  .btn-contact { display: inline-block; background: #c0392b; color: #fff; text-decoration: none; padding: 8px 18px; font-size: 12px; font-weight: 700; border-radius: 2px; }
  .btn-contact:hover { background: #a93226; }

  /* ── RESPONSIVE ── */
  @media (max-width: 768px) {
    .hero { padding: 24px 20px 20px; }
    .hero h1 { font-size: 20px; }
    .page-body { flex-direction: column; padding: 20px 16px; }
    .sidebar { width: 100%; }
  }
</style>
</head>
<body>

<!-- HERO (no top-nav / header per the requested design) -->
<div class="hero">
  <div class="hero-inner">
    <a class="hero-back" href="index.html">&#8592; Back to Case Studies</a>
    <h1>$($c.title)</h1>
    <div class="hero-tags">$tagsHtml</div>
  </div>
</div>

<!-- RED FORM BAR -->
<div class="form-bar">
  <div class="form-bar-label">
    Talk to Our Experts
    <span>Schedule Your Free Consultation</span>
  </div>
  <input type="text" placeholder="Name*">
  <input type="text" placeholder="Email*">
  <input type="text" placeholder="Phone*">
  <textarea placeholder="Requirements*"></textarea>
  <div style="display:flex;flex-direction:column;gap:4px;align-items:flex-start;">
    <div class="captcha-box">BS M3 &nbsp; &#x21bb;</div>
    <a class="privacy-link" href="#">Privacy Policy</a>
  </div>
  <button class="btn-submit">SUBMIT</button>
</div>

<!-- BREADCRUMB -->
<div class="breadcrumb">
  <a href="/test-cases/">Case Studies Home</a><span>&gt;</span>
  <a href="index.html">All Case Studies</a><span>&gt;</span>
  <a href="#">$($c.title)</a>
</div>

<!-- PAGE BODY -->
<div class="page-body">

  <!-- MAIN CONTENT -->
  <div class="main-content">

    <!-- THE CUSTOMER -->
    <div class="customer-section">
      <div class="section-title">The Customer</div>
      <p>$($c.customer)</p>
      <p>$($c.customer2)</p>
    </div>

    <!-- THE CHALLENGES -->
    <div class="card-box">
      <div class="section-title">The Challenges</div>
      <p>$($c.challengeIntro)</p>
      <ul class="check-list">
$challengeItems
      </ul>
    </div>

    <!-- THE SOLUTIONS -->
    <div class="card-box">
      <div class="section-title">The Solutions</div>
      <p>$($c.solutionIntro)</p>
      <ul class="check-list">
$solutionItems
      </ul>
    </div>

    <!-- THE RESULT -->
    <div class="result-section">
      <div class="section-title">The Result</div>
      <p style="color:#444;line-height:1.7;margin-bottom:14px;font-size:13px;">$($c.resultIntro)</p>
      <ul class="check-list">
$resultItems
      </ul>
    </div>

    <!-- THE SUMMARY -->
    <div class="summary-section">
      <div class="section-title">The Summary</div>
      <p>$($c.summary)</p>
      <ul class="summary-bullets">
$summaryBullets
      </ul>
      <p class="cta-text">Explore our <a href="/contact-us/">finance and accounting services</a> to achieve similar results for your organization!</p>
    </div>

  </div><!-- /main-content -->

  <!-- SIDEBAR -->
  <div class="sidebar">
    <div class="sidebar-title">Related Case Studies</div>
$relatedLinks
    <div style="text-align:center;">
      <a class="btn-more" href="index.html">View All Case Studies &#8594;</a>
    </div>
    <div class="contact-box">
      <p>Let's build smarter solutions together!</p>
      <a class="btn-contact" href="/contact-us/">Contact us</a>
    </div>
  </div><!-- /sidebar -->

</div><!-- /page-body -->

</body>
</html>
"@
}

# ─── Generate all pages ───────────────────────────────────────────────────────
$outputDir = $PSScriptRoot

foreach ($c in $cases) {
  $html = Build-CasePage $c
  $filePath = Join-Path $outputDir "$($c.slug).html"
  [System.IO.File]::WriteAllText($filePath, $html, [System.Text.Encoding]::UTF8)
  Write-Host "Generated: $filePath"
}

Write-Host "`nAll $($cases.Count) case study pages generated successfully!"

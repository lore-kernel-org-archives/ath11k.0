Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769DAC433EF
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zu6Xbk/MROIdTm0va+hjN7Ockq+1S/6rv+RlUOfpEEs=; b=pmnoOZn6ijygMj
	U7vcO1ZgxhlDx2SWukfwcSUpq0BKP+YQejfAN5d4re0IaqA71UDOue964J9j/K4rqZDRmrvkUW4G4
	ihevyav8rJLVNZ7D+9jAoA4GBFOQkBPXBSczinG6V8JDTeu+rwmUs9KkbC43urAhCWSVLU/myVQiu
	3GIzMzidH5W3taNhi0GsZbaCt0IDa8hVqSmPZSoYKCgMA1DTuvOhX+jf6MZQL5219pvot8orivLeJ
	StxrUwVW1ryThr3Ezkw+Oq3BC1ElBI0+UTPi3hcYc8/GhFk88H9k3wFq9Q68NDBYhJaYjtPHxLUtv
	YY7iSUYFrqwbOixUdi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmZIO-00FNW5-3a; Thu, 05 May 2022 11:05:20 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmZIJ-00FNUu-1N
 for ath11k@lists.infradead.org; Thu, 05 May 2022 11:05:18 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24590nFo027785;
 Thu, 5 May 2022 11:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ESSIJcwUldpJtsc7CTbp4c3VdOU3qij2WwGsGcwGHIo=;
 b=IdtqX8iRpO1r7wo6o1WLYQm0Y/V8WEcxbZg0IHYC2PW7czcWbW1O8Mr9mfB6CHdCnFMH
 l8H7vt2rOl2Z/eR9OxXj1H3xf6MCI2DBIptjFig+0iFOjSMRQgk5JDqYvxs22XRh0ZHY
 k3DfLQsb9knXlEifEQGZZ6qBSjRsp0Vf2E1bubocxWvMrF7gdUgLV/+ygThPABpHq7jP
 SdjZEGfTCiW5pe1oKYd16zVylEp/bf4nKNZCPo2rMzc8TIFgNqJ91GmwJCttcRJmCpvu
 ck6IuQYyOIt3zWPy+EopyRhSPqIjz1f+EUCDmll56yP9OPDhYOAkHKf9ZWZCTJ1TgIQU 4Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2k04d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 11:05:13 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245B0VgE015199; Thu, 5 May 2022 11:05:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj4eqqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 11:05:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlhoIIQ5+9GyAJLUOYfN7JcDEXOS1ysa14pimVyIpBs9FaFto2BZ8AyHNTvqJhkqoUFNnn1BTBmLzGAQdr7A5oMbisOD7EMv2BdF08pvn5pjZQRDaiJRj9NhJ7G7OyZqb1pYCAO3+1bnnjJpA1blh/T/d+U9CHuQzeLjqR5AIKfSsGWqI228BRKN/3IBZosLK0DjYSrY9e+iTlKbxl2x3IKEhVkPnYHmhoum4Qpdq7mJXBu+zSkhZXJ4cJU3M2reY1nHffTgXrBQVx2ia030gPfzIwnD1DaRuZ0VfhUyLiyX7gs+v66U172B3Q/564oHoXSjWE4cxEePZY2HBV5JQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESSIJcwUldpJtsc7CTbp4c3VdOU3qij2WwGsGcwGHIo=;
 b=Zwl2wskFUjddE9YEe5g/VQdi3mT9I/5yuEJFJo9KrypPVK7+toJiPs6Qte4UVvakri/kX+r0XbyHZJF5cIDGARlq5bEORPdAIjK6OXZyBQJp9RHx5AIVUWFDzQxdaxaofuQMcm7VFgO+L41V3fpEVWxLsEXkUSyM8K2p04dfbiLswk5cW+Aa0fP+3m57mBYhbLAJZMciaoyiscMQAvbIEQP669eVDqYRO5VwXd6nY6npoKNXYhJzptbrVos2z1Ru8p3H4S+VhYw1ZaTbGNxfLHMD7hF1YnSnU5q8+9Ze80FUq1r+cExEUDaR7gQvCX0X2WiY2ajWZuqmMQ1NV7W8iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESSIJcwUldpJtsc7CTbp4c3VdOU3qij2WwGsGcwGHIo=;
 b=VdQFpgpl4tGXTCHIxuzEhi9v3ac8aZK9rhPMPnWEF7MgP3vjq459bOjIbSijEKeJh4bOTtabw1S+oKVBZEnzBCoOaAj3s/hf56aw2/BwI/3Iwsnn/83cXE4cQOaQE6VsN8lIizFnmoMoyZy7T6KrVUgGRS9/0M0i4A7NmHqMF4c=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2344.namprd10.prod.outlook.com
 (2603:10b6:910:44::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 11:05:10 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e%4]) with mapi id 15.20.5206.024; Thu, 5 May 2022
 11:05:09 +0000
Date: Thu, 5 May 2022 14:05:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: ath11k@lists.infradead.org
Subject: Re: [bug report] ath11k: report rssi of each chain to mac80211 for
 QCA6390/WCN6855
Message-ID: <20220505110500.GS4031@kadam>
References: <YnOmHi3JhnFUc3YQ@kili>
 <30bdad0a-4cbf-b800-5451-99bdda144555@quicinc.com>
Content-Disposition: inline
In-Reply-To: <30bdad0a-4cbf-b800-5451-99bdda144555@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::20) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dab89f8-f866-463d-343c-08da2e871eac
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2344:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2344C091D9A49DDBE20DD01A8EC29@CY4PR1001MB2344.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJRhdQ9Sn4OwmKEqfhgDD38N7tVwlfQUo2+M9N/NAuVh60rWt1RJ8hEMkNpCsfz5Dusa2LqQZ/f35L5Qk8gujNj8g6xVqqgyhnQtdVqdGg3QMzygB1sAsyGScJV6uDWlndE5CjcTXwkemDvKb7THjh1MUIqMd7ShjXk66DT3MbK3dBsMNHH2BbqQCbLsxSjLqLhd0ccl6f0ucjPqLfIyfs/YqYqez5N6idCC92ipET3iW8AGo7vI7Wu7s8RUi51UrbjrCmJETptW26t3JyEEfBYvTMkBdN06hEylnDlt6+eOYB29VD7iOdjgj7cHDRqWvZFdXDaws7mw9AzX08H4dhPKAlyzPslDe7PjnGvvchvjyuWv6igF+Izhc6S4IhAOeshoMiQr19nAkNUdVl5O03xLGqrb6lmRfceRaotewQnHb4GZXIs6o71NSdPhdg3tnGoecph0fnX91JHLPs4lZtqRkAwvfhoqjUeYDUy/yeswuB5HTrq0IMNKBAY8m/BMGgIgI+caAPuqr8GC1AJ+Wn1RvvhMKAlXnToULJfmShqT3UT1SKT/848ObT0rpjlS45cP7OOP4r58ML00RpJz4d4pQqNc/P2s0pxhZSyRvqOZg6zOrkJGQmOZykNDvx7tqEzw+wn9LtQrZK1YhGGI6/l7VWZEczDnrZCJJ6/6MvRN/pfkaMqv19LexvAleirXYzeBt8ZAEVMvdGFoAgzfsu6351e60vQcUbpgvQvlCjd4mVr0Feg+JRZuHEjgobZSNy5zeh50n5DSWYi5GY9BxRo//XucM96/njfaHKIoPjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(9686003)(6506007)(53546011)(26005)(2906002)(86362001)(5660300002)(8936002)(6486002)(38100700002)(966005)(508600001)(38350700002)(33716001)(6666004)(52116002)(44832011)(4744005)(4326008)(66556008)(66476007)(66946007)(83380400001)(8676002)(33656002)(316002)(1076003)(186003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epIJvlzGQqbfO8D43v9s8uEA78VhX6ABj0UXURoGPuLFasSZUuCz8caoDYCU?=
 =?us-ascii?Q?ZQQJdidqQzKPVI9ao1yqV4yE7yOsvTNagq4upT+wKLBoWX/5R8dpEaP+2IPl?=
 =?us-ascii?Q?HsEkuoIBOK64MXenaba4ePZLkJFZwOIbOtBaB1F8MNBBMEc0rMYEs7O7V9IJ?=
 =?us-ascii?Q?pWT2FXxPc11K7r+R/VgvFsPVAwHzsh/+jJg/zxyu7PpKwQNtz1yO8uRWB6lJ?=
 =?us-ascii?Q?ybZXZrUAn4fiC8j+5s7KTrU4R+34gvuIF/KcbHddjKp7soEwJA8DPPu6d1yI?=
 =?us-ascii?Q?JP5tAloOwTa9LJGjMBUwyRnRmKFpzsf6p28pC8hXHKu2FSKxQM70roAIC6P3?=
 =?us-ascii?Q?AIoGMpGAVv++k0xZ/6Gd65F0d19nTX0wECOYb8ZHS/vWPEIDLW9WNhbgF7cy?=
 =?us-ascii?Q?cUSRvhb9Uk1vAbivQbZbJWEUxGhN5i4djxJqDqyp1uP/hN8LJ/Czei3cpbU2?=
 =?us-ascii?Q?UUSkqtoAGKosqsbOFREKjE1ZUuRa/pNMEBYiX/Gb2LOpBqP8EUwfhnN9sQF4?=
 =?us-ascii?Q?/JQ2ckYW7eBk6fPaQpHmT01GNC8gZUPymiWAuZbfvbXHhqREmWDHkAkw7z2x?=
 =?us-ascii?Q?iaUF/o+Ic28cC+TQbtB0a8+FZv+wFO7oYMUs3IE4J8GVL4ZyjWgCqXL2ADVU?=
 =?us-ascii?Q?D3kqcNDXddI0deTL0SpiSz8+/b03X4/nwSbueL+OoJKEN9IW9VcBMzl1jvIV?=
 =?us-ascii?Q?5Q1sFCl1748kbJ+eoZ2Wu3as04bgUTTc8H7x8UauKfzZ5AHNuchkh4//9rKu?=
 =?us-ascii?Q?6SRmoTzr6PLGseb42MBWdJN98lCmzbUXLglLHRq24+PVbpuk+4jrFF5YTPFd?=
 =?us-ascii?Q?vzO/2oNDqNsDF0R93FyaWclDr9XaKjzdMEBSHGXnpw1X8vKg40OWWvBxaFBY?=
 =?us-ascii?Q?y3C/IJkhVGR1hy5gpHG5o9o/ig73S4M/zh/Ozs3LxhLLrvYrJtQZ+A1uiCPQ?=
 =?us-ascii?Q?rY3UFpA5SYU+ELlKB+Tlanrf7EZx5Ws3iN17J5+oWoEwflHwwBqEYugWetk/?=
 =?us-ascii?Q?v/XJoJ8UNOQ79AYCjhF0s73KCDOu00t9LA9w8iH/m3GpN41HTXQWofrWosX9?=
 =?us-ascii?Q?5FoHg7wg7o3c2Wz2xhIekdcCeUiaeV2r/OZnoq39Cf8NrfIAjpDWs3+ZjK6G?=
 =?us-ascii?Q?wAzVUhHKBhVAKFiUOCkBYQlMk8PrwsJb2MJi5B3iZhU3AupBzh3Pl2HBIcJS?=
 =?us-ascii?Q?iGWUUxMNwP8taH5qK1dquRYZFcdAX1lRWzMfQVUtEh+5wsshwlaFvTXQU+08?=
 =?us-ascii?Q?YN/fk/3b32N0X8SWnYoq1SncOseKiUkWqSByr0NaFN8IE/diFOOCZbWlBBtu?=
 =?us-ascii?Q?u7WW97Jd6jEdXcvlFfEKksUOOQZKjL2ApqwPwwMWvOqujDgJG9qNPn48qs4g?=
 =?us-ascii?Q?/QzkY68hAllNN99IL/Ch+eA43kGVs0u4ktDMhEPEFQdNzEH78OvdgTVexn5n?=
 =?us-ascii?Q?alE7PYVaDzAxhcLLvlKc4/A81eK22pYuE2hXvUnK1ylszc3Xc8rjA2nGhh9/?=
 =?us-ascii?Q?ULtPSAzSkukxb/pp2dc/ppNIgkZquz+85f1BtiFCl6IQ0OG1UHXaCVCAuDK3?=
 =?us-ascii?Q?AVGt1j3MICouNNr6rJ/zy7aoT2MX53Xrc8fLy+TXlIybNcdlEMpJ2Fo5eQyZ?=
 =?us-ascii?Q?k0SLft4FRTyvtdd7Aen8xVPNiTmsYpiL1NZk8wiVvlRuXliMvhjXFuIEeM7L?=
 =?us-ascii?Q?v9NDKUqIBf5ENgTa+dy+i8yf/JiluSMpYYjUOwkCGILBe8J4Qnu8KBO/85WL?=
 =?us-ascii?Q?163K6k6btKdCrrcETsFyOSpFk1o3NHc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dab89f8-f866-463d-343c-08da2e871eac
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 11:05:09.8129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0ozQlr7ZcTSKTdXwgadjpiDsditj/NjL2Y/n77k6AMDaAvh+YyI3XBdicntyGbxWa6CH3QVddOaTXio4cto1bfLOq5+KiUJL2CyBLyNWSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2344
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_04:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=750 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050079
X-Proofpoint-GUID: o-OYK_Wu9VF-Y3DboKV3WSLejnGDBcdq
X-Proofpoint-ORIG-GUID: o-OYK_Wu9VF-Y3DboKV3WSLejnGDBcdq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_040515_239255_AF860C05 
X-CRM114-Status: GOOD (  16.28  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Thu, May 05, 2022 at 06:32:48PM +0800, Wen Gong wrote:
> On 5/5/2022 6:25 PM, Dan Carpenter wrote:
> > Hello Wen Gong,
> > 
> > The patch b488c766442f: "ath11k: report rssi of each chain to
> > mac80211 for QCA6390/WCN6855" from Dec 17, 2021, leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/net/wireless/ath/ath11k/wmi.c:5800 ath11k_wmi_tlv_rssi_chain_parse()
> > 	warn: missing error code here? 'ieee80211_find_sta_by_ifaddr()' failed. 'ret' = '0'
> 
> yes, it should return 0.
> 
> please see this commit:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath11k?id=7330e1ec9748948177830c6e1a13379835d577f9
> 
> ath11k: fix warning of not found station for bssid in message
> 

We could silence the warning and make the code more obvious by setting
the "ret = 0;" explicitly or another option would be to add a comment.

regards,
dan carpenter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

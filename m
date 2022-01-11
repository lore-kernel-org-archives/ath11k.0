Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F2AC433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63mXgDyRaD1cfLMy2ABeysMqoeyX5d4qCge/kessi3I=; b=3LI7OnZ3OZjEa5
	8TckEBarYVIF2aFfmmKjgenNljESWKvujQD4p1t9TJmh5OFHJU9NLoyFpRRu1pYZa5+Yr3joHzUKy
	tKoglWXV3Y8JGAiIe0SWwus0Quq5MHSvb7dH6V3/NXHYC/v2QbiYeHkgBUsJcPhH5M/Q066/VooWl
	Ki3KyM6fnhYhCso9uTA0ZmMcTqe69jpUHsZadGHaqwVbuJShr6DuqfwdPW5EV0CrtwUmibIRoEKht
	ernaUwIeaR9F+HP9oxBg0JAiVKmwABxfx3Q7hQp993QiAO48gRN1/QeYoOO0nmbC2w7i/c8VD1Ohf
	JrCJmHoVuQxqfNHRJ9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Bai-00F6iw-Uc; Tue, 11 Jan 2022 07:29:12 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Bag-00F6hu-8G
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 07:29:11 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3TB0D030524; 
 Tue, 11 Jan 2022 07:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=zh34+/sNUYUe3dNCz32QwsMcs691Gj+wb4zJKX7h9fs=;
 b=GMbuPUufcBwErAm29RiPBSNuPRkBtGSeZCdtYpI4BS8qEFkMCKeFiXIPumOBjH0pU3Yu
 Y0fCu7xuS6y4v0KGVB6AzMaxFYFWpJQClVDuYeGWj8k9Lv0JCnBshMpAGqRqgSdUJtGe
 l1uFdl8KI+Iyp8cPL8A9116YclaJ2ahKZwuLIwFqGeFXgolkD2zM8KM0Z2grAFU7S05L
 l3lxC2DQ8fY7+WY4tup48oyuL2HlxHxffUtpVWiUg8HShQvwSvraGajqjKmmveerXj9S
 jZKCRwn85yqKAGHWie1TectxiN4y33HmkAluYmYK7mUEfLPbKSy0DvK2hGj3xllcsc+h 7A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx2dmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:29:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B7GYdQ047259;
 Tue, 11 Jan 2022 07:29:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by aserp3030.oracle.com with ESMTP id 3df0ndp3x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 07:29:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKNmjh/e8kMmGnhd0rUf+JzXYmGsIMoEm4N5hP3P98JA0RY6W58wNeXbOaAxfdnKNS0sv/dBJgC8D+QBiahrYHyvsr55eqVpDPh/QH4Tjjo2JOOBEhAPbvxGs57AJEzEgFICL+g3gkOs7qQIUSb7esp1MJxMBl+UMgtYR6+/7jvEJTp6sTKx6NBElD3E2UX7iR5HCH5JRczqQBJ1Q8OuKkmMvWC9yBXRlOleKS/SwN57pDZNpF4zPRfGO35/CsCU7B6QsVCIFhWJ506oTGDhT1hZ9Rw5EjEnDLSh32dh6Lb2wOm7La2+GH5fXEDPOEQjxnqrOqeDHcvFA0d34pUoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh34+/sNUYUe3dNCz32QwsMcs691Gj+wb4zJKX7h9fs=;
 b=VK9p9igd/MmoUhIVVbFOmizCKVF94tK0ujgY/CjimnP84z4P1SXzNw51UyiLTsf0iKOfCQTr1Gx7Ev23ttllxC++mHvBrqU2R70eSmJqloyx61BlWhldV6NMDASuoq/WhUG6yd6ePhFxvB3PmB2NeJQ2SSVtzIOYgOg+ukRlDvurfwtDM52UIfh2tHTZOYFPI3+MAXP4Gi2O6rB+IxKzbBs7OWI6/JTJruSRM056SbqcRXEWI6lQhZyXCQ0P0DFo7sppOeyD5UXDVaFDu6bRFNlKJu/B3k9irlN190vyk3ByLzicf+hDPX3cDWvimtHws5KoKlUUEzRwjts5xaV+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh34+/sNUYUe3dNCz32QwsMcs691Gj+wb4zJKX7h9fs=;
 b=xNF5B74EoIjo1cT1oGX2NZGuX6eAP8NZVk5mmtJJyDxNMNvmsw0gDJhhbdIL49+0pjZpN37RnM95I07vCUthgsWkycIw2uVjz1qMaizrMtdVIDLufdladCGHPW3lXuWoBUbqGYn0FahNaqmR/12yeZmCC2PeWIhK+gbkPIyxlQs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5678.namprd10.prod.outlook.com
 (2603:10b6:303:18c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 07:29:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:29:03 +0000
Date: Tue, 11 Jan 2022 10:28:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: akolli@codeaurora.org
Cc: ath11k@lists.infradead.org
Subject: [bug report] ath11k: Process full monitor mode rx support
Message-ID: <20220111072853.GL11243@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0183.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee3fd37c-560c-42ea-1325-08d9d4d40b4d
X-MS-TrafficTypeDiagnostic: MW4PR10MB5678:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB56780C340E998012A134CD3D8E519@MW4PR10MB5678.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dc+uGUEoCbnArHIhIXvDbFsrOAeQnppAVrdQyMvqi8l9yBJDuqx+tNJpdHZZD2ig2f9X2976fNk716ijIgeLIM8jdGjYl07fjoS3gFXMc8qs7D7pzLynGwYG8ZiAeiy+BUoRpS/g5iU3R5AQc2ojTrEv9OEY2855CnDEcMBkDSdzp7UX5eqO6zR03rDxO46lHZ9e4L1coikhqgmgRHDUFShCASCNriDV5BNEL8+qjdbJrl1F9f570SiTLrvuYtpeqi1nHKC77aLDKGm4jPIr4kh07PfMF2gKURchRM+76qrln1grbsOmLdOYN6iXvk10DCPvL9tAlJfacyIapK2PlAZx9jYvJkIXcdhSUsGnrtTfweOCGdNn7UQaE72v0LEckYs+zn3HS9tWQQcYSVMEfuiqAK/1Ci1fQxTS8SxsDoIqY/d77CCyZcaRk/+rkUhrGitWLJV9YlEyXPKbigm0Fo3nGgt/k9kgoyfKkucnsFEBFFqzpacZeE5wFCILj/ClVLOP1lDKNn34fRzJlE/+oggosprdCLho2XGc1UcVJsfkaKgJjqfJG5fGY5zWphzFnBPsMY4jChz1vHzufT8JJfvFuqhjQSP4zTWRrYOKwD9nq9WS2mX88BpWqtXS6W+CYRR/8I1uBMxJpkJmINR7NE/z1cAtZUw9E2h3nsY0ZWt2vwW1UImikc/bs7WYX5+rE2SUsREre4fGiDflsFNb8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(38100700002)(44832011)(8676002)(33656002)(38350700002)(9686003)(6512007)(316002)(5660300002)(8936002)(6486002)(6916009)(6506007)(83380400001)(6666004)(52116002)(33716001)(2906002)(186003)(1076003)(508600001)(66476007)(66556008)(66946007)(86362001)(26005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7LVY4IZKN6MjdtrCD8w8XUx2UTwhTdlrCNHSMZk7Zxsh1u9SdWR91xTj0CeL?=
 =?us-ascii?Q?cJWetsWAZj32qMxDI+rpWkR/yAhMrvDlHCHBHOD2YzHWlxFhG9uLozZM+iTg?=
 =?us-ascii?Q?9bEbSUxyIy1qKhR9yX8w8GwJpDYTM5QQgq7I8aYebNcoMcroUEUj2gCn6iqJ?=
 =?us-ascii?Q?Zj5jghdOUBEg8cNMMmnyNobvVnxEt3lrvsgkmPZM80G/suv9deF4GB7s0X3+?=
 =?us-ascii?Q?jOZ3q0Fo/6uqN6B2A7G1K1bsJ6u+40WW8hQUpZzBntff8eEQNLlnH/2N17Vi?=
 =?us-ascii?Q?GRrYLicGfVzbnGR6j/pGzQ7c9Wxuz7UhK8KbrJ6qUCpdhrTQ+2OwiF65YL8i?=
 =?us-ascii?Q?/4TAyA6RbPHfmo5s9VNLMOzlurApbiSOoafCo2Ok7BzCnUjwLZdF+UrMgzSu?=
 =?us-ascii?Q?UEDuA1wqzO32XU//qFW74gYmhcNT+D5bBndmxcO/Pgy9As5+s3c5aLRO322Q?=
 =?us-ascii?Q?t1s00Y9Wpzpos5H4tkHaD+fuoRPET0z0itmgZIIlxzkqhZYDF/uMILCX9+Gl?=
 =?us-ascii?Q?1Fn2RG+gTsudkvmdqixT0WSZFvCUQcVFxOBdfzDDdhivzKcpNsAjXhVwoX/V?=
 =?us-ascii?Q?tsd15MwVR3yv5R8qGLEoLMMQEp9HmgNKb3ZBIHN+/EWBDsdyKVz4vphiLpGe?=
 =?us-ascii?Q?PgAp/K+FP4gfyWNqOWjA/rRgEPDg3Izuf5ADrGuq2kVgSKfJx4akP3vz76/V?=
 =?us-ascii?Q?G2YUaLXGOmz2yahZKxKu1xT2mwdWuPFl/qtcfscHMkuKAUhK+0aSPI7Ga4Dm?=
 =?us-ascii?Q?RyqAzqNBr0hlXmxWV940z+ukUe2COFJ6DwqQafDkN8pgpmELtP2r8rnEBq6Y?=
 =?us-ascii?Q?zal6cUTKqCOVPU0zChIc7Mixla0ZYmZtNr0ix2qj6kqFWUyfoKmDS35yzJgw?=
 =?us-ascii?Q?ahnPMyycV4qNB1vUYQmjBo5HtEBVzwaaYNJaRfxiE/pewpXxJoABmhyqGmgY?=
 =?us-ascii?Q?YhS8c4qRoTHoFwpGD+rUG8TGLfnhLwmmWI7CTTKMTWLZi0O+9T8n7sk7Lqr7?=
 =?us-ascii?Q?n9fFTCU7tWyGOiljzsNkzBnLJ/gHlSFWkYACeypBTQ+0AXZ6J8HhFZkn6Uam?=
 =?us-ascii?Q?nOj+Nn63XULO2toaOqMqBPa2H+Cdf1am38BQJ3s4OIkAj6WG/6jpzSKzCwNM?=
 =?us-ascii?Q?yNoUOVk/YwirQXmdA/Y/79gGcdlQPQsz6NxBw/uBq9CqkBgwuS34vuX3A3oU?=
 =?us-ascii?Q?+m0gRXBF308MnVz7uidhruqMlZBXXW+U4qoSFg1Fu4VUp+W++vX0ZBwn1LMt?=
 =?us-ascii?Q?Q9WYrAnyXKM84AG1JQPeNJQhFpmBP0i60L6klYsNG1f1Rfi4LPWBHt2Em9YN?=
 =?us-ascii?Q?t8bYb4xnU9jF+wvxWVbKbUdaTE86m3aWPd3SrOsAKXDx0I7Li34TWGMqvNx8?=
 =?us-ascii?Q?AU22RVz/2OJrKKp034DWPmgY3xmyDGxBjFDXSc7FEMieYaeQ4bcMJVJOzAhF?=
 =?us-ascii?Q?ObjekbxBToqZQLNMbFyOu7/YpmmJj1ihFXaJNUgoAnckGRF0s0gcf2bDp42u?=
 =?us-ascii?Q?xpgtuzSlqdvCF8pGyvoRzu3fWV2R5GStrbQp6ckZJZJAxXmPME11xlvAOfC0?=
 =?us-ascii?Q?WC8tby0ZWIKd3lh5aSQOF0KmJCe2AruBph3nSNYl1UH7pxOYEtOIqFQnSs1a?=
 =?us-ascii?Q?DO20Va+6icTwS559reXRiw4hGAqKVMFryGJzDo+F5HOj9ZiSOwRhVwFU5rXg?=
 =?us-ascii?Q?VQOlbHHgv0Q2Cbo2fRvimHRMsVs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3fd37c-560c-42ea-1325-08d9d4d40b4d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:29:03.8797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8yEjsWluATnueXFrLNIJTjdsYKS35tizsxEOW/gKB0fRNdHo7PMchrfRV+D2N65Kggjf06YOTNwSITkLq0tRmlLy21p2HWqBsWgh01sNnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5678
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110039
X-Proofpoint-GUID: a_pGN2MAFXURx2H_rCasbVQ4LFOSZOgE
X-Proofpoint-ORIG-GUID: a_pGN2MAFXURx2H_rCasbVQ4LFOSZOgE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_232910_450730_074C7C32 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Hello Anilkumar Kolli,

The patch 7e2ea2e94704: "ath11k: Process full monitor mode rx
support" from Dec 8, 2021, leads to the following Smatch static
checker warning:

	drivers/net/wireless/ath/ath11k/dp_rx.c:5362 ath11k_dp_rx_full_mon_deliver_ppdu()
	error: uninitialized symbol 'ret'.

drivers/net/wireless/ath/ath11k/dp_rx.c
    5334 static int ath11k_dp_rx_full_mon_deliver_ppdu(struct ath11k *ar,
    5335                                               int mac_id,
    5336                                               struct ath11k_mon_data *pmon,
    5337                                               struct napi_struct *napi)
    5338 {
    5339         struct ath11k_pdev_mon_stats *rx_mon_stats;
    5340         struct dp_full_mon_mpdu *tmp;
    5341         struct dp_full_mon_mpdu *mon_mpdu = pmon->mon_mpdu;
    5342         struct sk_buff *head_msdu, *tail_msdu;
    5343         struct ath11k_base *ab = ar->ab;
    5344         struct ath11k_dp *dp = &ab->dp;
    5345         int ret;
    5346 
    5347         rx_mon_stats = &pmon->rx_mon_stats;
    5348 
    5349         list_for_each_entry_safe(mon_mpdu, tmp, &dp->dp_full_mon_mpdu_list, list) {
    5350                 list_del(&mon_mpdu->list);
    5351                 head_msdu = mon_mpdu->head;
    5352                 tail_msdu = mon_mpdu->tail;
    5353                 if (head_msdu && tail_msdu) {
    5354                         ret = ath11k_dp_rx_mon_deliver(ar, mac_id, head_msdu,
    5355                                                        tail_msdu, napi);

Is it possible to never hit this assignment?

    5356                         rx_mon_stats->dest_mpdu_done++;
    5357                         ath11k_dbg(ar->ab, ATH11K_DBG_DATA, "full mon: deliver ppdu\n");
    5358                 }
    5359                 kfree(mon_mpdu);
    5360         }
    5361 
--> 5362         return ret;
    5363 }

regards,
dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

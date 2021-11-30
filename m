Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9EAC433EF
	for <ath11k@archiver.kernel.org>; Tue, 30 Nov 2021 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l9tQvL/5pPk9qJytmmmoGSh8rWbh0g98ubMxnl1Nf4s=; b=tze+DTyuVnWHlC
	ilTWkiwQ22Gem9MidH7hsBLYPTg4Hx+iGt2/cMHAmhGPkkZGAKD1OiRYCUJzO9SLz7BRKB86wlcmp
	PWCHDp4qpCy7lIGDOPni4tUdKIXUBCUZ6baLfVnuB5Bp9mGhCFy8+20FlcbqWbUVAxgIRjcir4K7l
	zxNFGfCT3J7Vai9miL9iZfEmphppSLlClNRzl/83LsRwYHwPcA65eA1V105fbpxxyx7nhof5pJVrO
	lewFvL1S4K9jRgjUKjbSWSlMEbz5VgARcwQDOQd23lcgP2a10Yb16h6+gdKKav+toQ86R7jLraN+N
	o6wEaKlqxi4IAcWbChXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0ah-004gzP-Ov; Tue, 30 Nov 2021 10:42:27 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0af-004guj-2Q
 for ath11k@lists.infradead.org; Tue, 30 Nov 2021 10:42:26 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU9TRgs020991; 
 Tue, 30 Nov 2021 10:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=bPzvOuYIDk5a/Di0lioQ0F2q9ue09m59zWBVFwRmamQ=;
 b=xdCmvJw1cJhtpoWx4GBSeAduyFkC3eezVuJZeay+BWJiiN1GIsaMYpTOpRJTeBzwJ2+T
 d1ZpiJIq7/lc4NgXh/I3Dm9b2LpMzDruD3GkzUFdNBCr9K0Z1SWZ4A6AbGOziUoJB+kx
 EbGqL+4CACpSjVzHZ/TmCpSsRSgczjYSemoPVkYAzwBMX78Ty04ETXsl9vszQgX1+czG
 VuZKlaChoWLDAm38hQ3QWYh3p7ibRLnGubIH+QA/LgUxKsPMjwwBy+ZT/vbAlvrZOlfK
 Inm0RQkTfe4+KZey3nMfRkgTVnYAnm+nuaMqQJHSeMtS7+p8qoNnCnwwquRd5N/MTK4i zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cmvmwra10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 10:42:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AUAVfCI190830;
 Tue, 30 Nov 2021 10:42:11 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by aserp3020.oracle.com with ESMTP id 3cnhvchkcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 10:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDRlGVB4Xlbg37NHgriPy+bVPctyNInnA8mA+wNmhMsVTQRX9kGBGxDccMq/9tcLk8CADVHk18SHdVfy+o4ubBnEIjUo/2Gd6VxVZSDnVZFU4DAA2s5q3w4XZXJVzqTUcyRu+JL5GD64k5xQolmUhH6stR+ErFtG4yrrEMsc1ouCjXRZLONd8sMmFygW5zFuxZN6jIAcu0p2x4rXI2U5b92Hxmhg+GBkmkHOFy3rmq2j0f/mu2lge7rexA5LBO3ElmQUeqFaLV0F9DLxUykbe7sHDQYRM9kaCa4Id5D6SR6mH/50ct048SncvpQfRxDcXXRqw8LSGo84lq8tXKJj6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPzvOuYIDk5a/Di0lioQ0F2q9ue09m59zWBVFwRmamQ=;
 b=QmguXdjghB0kLmduKBEEgTLF91Xy+Kvr98gMWwH+8aenaBa/gjx1RlV+2Jnfc/21rnrobqDlGq9+l3AcLybFMfhH+aX/PsrDNdjrAMG1gk4UmyY2LrK0JePUd4ZVuLmZgORc5BnnFpQoeTJ1NN872D0knWgvrZGt/Ls78i0Xn7tVdAiC96opXQwn6UxgNXCU2FwvO6qCuw22u0YLznEgkYk4FoRniTDM1/l08R8M4F7G45ynHve56bOpbA9lXHzQsR1CFyi4BwuSMVB0vcKrozIQhkLTQvSltJyhSS5bI+A25x3+R0rxARKlhxIBv92Fu8qqHT0oyT0uUn1K8SwaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPzvOuYIDk5a/Di0lioQ0F2q9ue09m59zWBVFwRmamQ=;
 b=DXdaR1aw2E7ogjgtwM3nLPcNTlPdXK82spReLnadBEYCMMXDiuZtup8zUHderk6bnn+WrfjF1RX93n/1apS503hRiAuIvyiGjm5aAqw1Cwut5I9tKGmkADtTiujaIMs35NuuHybO+G0AhPeFP8u8in7NJyN8+kr9Q9ApdaYzFCQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1357.namprd10.prod.outlook.com
 (2603:10b6:300:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 10:42:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 10:42:09 +0000
Date: Tue, 30 Nov 2021 13:42:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: akolli@codeaurora.org
Cc: ath11k@lists.infradead.org
Subject: [bug report] ath11k: Fix pktlog lite rx events
Message-ID: <20211130104159.GD5827@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0113.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0113.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Tue, 30 Nov 2021 10:42:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da528a5-ca2c-48e3-42b3-08d9b3ee0f9d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1357:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1357A8155BFBD10CDEC6A6AA8E679@MWHPR10MB1357.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5DmEUVdOqhb1d4NIO5R+7PsUwe3I0W6ffLBJ318qPLBbJvPyCO0AZe/rgJ74Ds64MsFcAG8Vpt15mESytWGKQtllMHkpgE/Pl0SNxaRTJtAZr0c6ry9RqQiPUHn1GtlDvECn02bT1d1KjKQVQ3Mop4DahfS0UEAnw90ZbLnbwHt9nGzeOQobkTwVUww+yb6Z5CAOfkna8Sn/Qdjdc22n9IUfVfFdYABu9pKtQLnvmXMcCswQ+DVep9v6L6cuPxY3p0yPiJfzOAAm6JsQWpLkS3ikGV8hOn23yjh5vm9QwsOoE5Z1zQn+flHCDt2VOYGwKPW3Sf+RnvzkhezME3ZFgx8AgPDYdNPr3BGjBpa/LSBeVc5EIIjixhcEWB65avl2LgLMzbI/MXqejOK2vbVKBJuYOZIXnPIs3QeDqOfqoNOZsveF9ZzlF5Ztq52wKawus355obN7kHibW8Zsq7e2UO18gPJ+vtfC+7wt+9zMgJNq/3b9mVmOGoxyBUW+YYk7nMDwHSVD94TCP1aq1ScKN987zg+pWHX3lEfCnD6vTCQsqdvTX0ifOTmXyRZkB5BLyU34noQzlogYSBtp3EpvIE2FyGN0b0TOzf//MQBHzqbOrznyn7AM1ra8ntcZbtUMPIOoaU3ohclRWUKxbOMR0nAmv9ErJP9XOA8uHuqyONRknzGXuSyHARSoZq+zp9aGcRVXd8rdx+r4xQqx/V9jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(33716001)(9576002)(316002)(66476007)(8936002)(66946007)(44832011)(38100700002)(6666004)(83380400001)(38350700002)(956004)(9686003)(26005)(6496006)(186003)(5660300002)(86362001)(33656002)(508600001)(1076003)(8676002)(52116002)(6916009)(4326008)(66556008)(55016003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+LFfVBIHRIU9sqhAEmnQa4a+REH6Y/dmj78uVrpX7aV1+rWbwhzUCT4KVGBW?=
 =?us-ascii?Q?L6P1E68eRoysUPPye+rntav3nxqEDYkxhp47bfIe9STx71RIkHC+iw3245re?=
 =?us-ascii?Q?DYYwFJ3mTrdVGEHGDUlpO2jy2AZxrbaauh14N8H3DMdk2NeSRP+vQo3O4wDY?=
 =?us-ascii?Q?J7MDi4ndnCosa9/hqRA42UbqwQ7WVrmkZlDxr5ZBpzNyJOtiX9NgCfj71TlO?=
 =?us-ascii?Q?LpHGTif9UyOi6qGvp9gucOJjkyqW60TL7wwRCtmh0W6p/x1k4rQFE7lQXyxb?=
 =?us-ascii?Q?AE0G6MMEsZxMQuoYHJRqqZX+Hn3fs/IkI5h69yZGiCxCivSMDUmSjxdqb2u4?=
 =?us-ascii?Q?fFGoJI62nM/gT2UgHzBVj0jWLguasdhNTWp3KeBGpz77K7Ei0ZdHAYAwQwYl?=
 =?us-ascii?Q?ffBctZdXr4TzDic/stVpGDolV37xpXluhJQ4SlMDqctIuHCmuvCsz/Z2fUI3?=
 =?us-ascii?Q?8aZsQ3ks7KMWSOsCh1VmSU7+j4q9DdSoGd1NKMuHARwvB8q8tp8L4Dk3BdNu?=
 =?us-ascii?Q?OKfR6M9SYzjg+o3oCLQXoAEVi70sJ1gQ6Ightb2L70/qWKdLCMJl/ssgOP1J?=
 =?us-ascii?Q?RZt0Q2u1SzKxm23qyQ2rMUtMwc+VlnuNNHZXAJ+0JIh8bDtGT0vT2AOT8tC3?=
 =?us-ascii?Q?a+0ok8zjy4iEyum1oPT4NcYDfu0xFs3YtayxYHAWn9VN6RDS9ye4YMCPpji8?=
 =?us-ascii?Q?CGD6/Mmjmo9fr8et3bTIdhz3dhQn6X1o7Nv0QgqLdhzNeIVgcUT/B575tJjf?=
 =?us-ascii?Q?waH0j57j2myrCnL+Vw98cpFvPTVdQ1oO8uq5XAFVi4CiWvknyijupW1Gu68P?=
 =?us-ascii?Q?3EfkE43ODy9+IS6xIyc7U2Wb+La1bwa3fF0o+D04OGlTafKi2aIJBotiF6Vy?=
 =?us-ascii?Q?D6TsPil8Q0/RA/UZ2VQSpag9sqxLzfgs60goGHADTs4qh0vnVYWzBH2WPwVt?=
 =?us-ascii?Q?1nCef7pj+TNfPNHh2+VKjZClivYTRYjP19JK0UA5xBGohdLM9WXTjP5zp46d?=
 =?us-ascii?Q?mp/SRBX/BH3ZFYj59ZTFA1UN8iZUpsjUsSqLL8yzHjTb8LQpzaE25rixs+JC?=
 =?us-ascii?Q?3LG2939mxTrcrlmK0o5l1mzyiEYBhMBViYhjjnSvJ+DvvYe5qXJ7qAeVkPwJ?=
 =?us-ascii?Q?qsnsx4aY35AH5Y9fghbPphU5kmbfSeH/9Bm73wIFH+HSlLkllk2TZlKSMaHh?=
 =?us-ascii?Q?avwXGcb9uI60pEyBdcxknzlBJQFnm7wJ1ZybsNLVl7cIu7skGwZtKyOaBRrs?=
 =?us-ascii?Q?Dc9JYt3qLgV1lhkaDtOFb2sw+WADt+NZ+RQZ0azfu+XQBRRh8FT5sTOYIf88?=
 =?us-ascii?Q?SMiHuU5fFkZYHdd2tTBv2rrf3uSYG8Gd515okJbDDXqKTnEtEJbQK7SLrfvO?=
 =?us-ascii?Q?eG3y1UYbQREHXALOHrMlQP2+YJKMZZaZlmNHzRlhwIC7OofRlVV3EYzudeH4?=
 =?us-ascii?Q?1zEOZmaeZwEsCE77SLDvnUlitbxB4j4q7tslu2xQXxjoaUb9UaAam2NtYhNT?=
 =?us-ascii?Q?m8eE28RRpyG56RGI6aubN+fs5ZIPTimirSGp+zaDBG3lDcdWC3JQyny9Rs8n?=
 =?us-ascii?Q?agE8YAmDGGKibTE8Jg9fPkHBU6AjF7bRaF2JcSseaqxqo4A5heMlN/VhdpGw?=
 =?us-ascii?Q?CgjIAi1HrbpVjO1FQOy9ZpxHLfOL8dfiG8UGVqBZ+6c3M4Qytt3/2trd9ld4?=
 =?us-ascii?Q?z+krBcacN+cvGxqu+9l0K2jRWwI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da528a5-ca2c-48e3-42b3-08d9b3ee0f9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 10:42:09.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whZRXzwKE2pFFCnaDFmuJXg0GbzBGtopF9xBf+ZB3R96e6XGpvRoklk+DFTffRY91Fl4Hj5W8DiqEqoTaPNW5NvaGqFbjDs8jNrKufLG4Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1357
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10183
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111300060
X-Proofpoint-ORIG-GUID: 4t6HfJno43s19ZuYfk2nGiuSSU7aymke
X-Proofpoint-GUID: 4t6HfJno43s19ZuYfk2nGiuSSU7aymke
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024225_186740_EFFB2B66 
X-CRM114-Status: GOOD (  10.99  )
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

The patch ab18e3bc1c13: "ath11k: Fix pktlog lite rx events" from Sep
28, 2021, leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath11k/dp_rx.c:3105 ath11k_dp_rx_process_mon_status()
	error: uninitialized symbol 'rx_buf_sz'.

drivers/net/wireless/ath/ath11k/dp_rx.c
    3043 int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
    3044                                     struct napi_struct *napi, int budget)
    3045 {
    3046         struct ath11k *ar = ath11k_ab_to_ar(ab, mac_id);
    3047         enum hal_rx_mon_status hal_status;
    3048         struct sk_buff *skb;
    3049         struct sk_buff_head skb_list;
    3050         struct hal_rx_mon_ppdu_info ppdu_info;
    3051         struct ath11k_peer *peer;
    3052         struct ath11k_sta *arsta;
    3053         int num_buffs_reaped = 0;
    3054         u32 rx_buf_sz;
                 ^^^^^^^^^^^^^

    3055         u16 log_type = 0;
    3056 
    3057         __skb_queue_head_init(&skb_list);
    3058 
    3059         num_buffs_reaped = ath11k_dp_rx_reap_mon_status_ring(ab, mac_id, &budget,
    3060                                                              &skb_list);
    3061         if (!num_buffs_reaped)
    3062                 goto exit;
    3063 
    3064         while ((skb = __skb_dequeue(&skb_list))) {
    3065                 memset(&ppdu_info, 0, sizeof(ppdu_info));
    3066                 ppdu_info.peer_id = HAL_INVALID_PEERID;
    3067 
    3068                 if (ath11k_debugfs_is_pktlog_lite_mode_enabled(ar)) {
    3069                         log_type = ATH11K_PKTLOG_TYPE_LITE_RX;
    3070                         rx_buf_sz = DP_RX_BUFFER_SIZE_LITE;
    3071                 } else if (ath11k_debugfs_is_pktlog_rx_stats_enabled(ar)) {
    3072                         log_type = ATH11K_PKTLOG_TYPE_RX_STATBUF;
    3073                         rx_buf_sz = DP_RX_BUFFER_SIZE;
    3074                 }

No else statement.

    3075 
    3076                 if (log_type)
    3077                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
    3078 
    3079                 hal_status = ath11k_hal_rx_parse_mon_status(ab, &ppdu_info, skb);
    3080 
    3081                 if (ppdu_info.peer_id == HAL_INVALID_PEERID ||
    3082                     hal_status != HAL_RX_MON_STATUS_PPDU_DONE) {
    3083                         dev_kfree_skb_any(skb);
    3084                         continue;
    3085                 }
    3086 
    3087                 rcu_read_lock();
    3088                 spin_lock_bh(&ab->base_lock);
    3089                 peer = ath11k_peer_find_by_id(ab, ppdu_info.peer_id);
    3090 
    3091                 if (!peer || !peer->sta) {
    3092                         ath11k_dbg(ab, ATH11K_DBG_DATA,
    3093                                    "failed to find the peer with peer_id %d\n",
    3094                                    ppdu_info.peer_id);
    3095                         spin_unlock_bh(&ab->base_lock);
    3096                         rcu_read_unlock();
    3097                         dev_kfree_skb_any(skb);
    3098                         continue;
    3099                 }
    3100 
    3101                 arsta = (struct ath11k_sta *)peer->sta->drv_priv;
    3102                 ath11k_dp_rx_update_peer_stats(arsta, &ppdu_info);
    3103 
    3104                 if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
--> 3105                         trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
                                                                                  ^^^^^^^^^
Warning here.

    3106 
    3107                 spin_unlock_bh(&ab->base_lock);
    3108                 rcu_read_unlock();
    3109 
    3110                 dev_kfree_skb_any(skb);
    3111         }
    3112 exit:
    3113         return num_buffs_reaped;
    3114 }

regards,
dan carpenter

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

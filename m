Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB457C433F5
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTwoUo/Mt+HCJNO04p6MvDR9JAqFJPOZmxS5kX8ItTs=; b=2YDycrgUYXlV0H
	oWYMDSG5+G3Dj5lI34ltk3qfIex4JB3zfpXXS537c9yqw/LgNou5CtmziAKuyp1yUCXQEY0jGyIVB
	6n77yVzLLl58gV4VxIya0xbxi6VgMU0L1aR0OuLkSNYlqYnRVRFmuuye79ktdyAm/tPnu/AXrWSXO
	HqvElH1aYKpIojFEF+s3dHw5iNiti8hau7uFz9QMEuTfjZpQhLmVb5DkYLOth5vEJlJSDRZAWm6Va
	Xf59EeQHLM9ghQrBnFbLMSaRBv678To/upKOhWpSzeYfNfhQbCjmCKLKOEvoRD07p/YKqNegMasm7
	FUDZRucKQV4hOYZNbVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmv90-002h4p-7I; Fri, 06 May 2022 10:25:06 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmv8x-002h1m-PN
 for ath11k@lists.infradead.org; Fri, 06 May 2022 10:25:05 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2469iADW003197;
 Fri, 6 May 2022 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=zBQaFxwBtpTRgiP5jcKiU6hYBZWX5tdELGZHcKJyYXU=;
 b=ejCP5pQFecJy+y/Sg1qcaOO82YQrqrybVQsXNNRs8l87Ijio5XOfaJ1CBJZYjqwjILKr
 /UyahFqyzc//jLAV8YDTp47Lt/guflQJabH+IMbqP+WMazOLrylJz03ZibgR46nwbE+V
 WnKRdWmVAINzYHwWuNi2tShm2LacyCJnUaY1GbwHG1rjjPLfdJD2KMjeEw1/BEocFFdq
 ieBDis/68RkZagJgiQ6wk0g4bjVxv6xIsvzQpJdTST/hmYhvUZJ3TNEGX7JtomioN2TS
 onlNVZzniCxKJ7/emWDR0pL/LW9f88ORluoP8Wdei5mUQqzgBVrj8Fe7o2Bs+9UAWvMe 3A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0awcbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 10:24:52 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 246ABfdl022694; Fri, 6 May 2022 10:24:50 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusahvjn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 10:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXC+hZG2zdYxSDReKl87TfkzGmvRJQJtXw1orie5ybxQ796AP0jYfjRn3u81gqbDAlCH5EuylyjetJt/CXN7G1vFpTlPS5PDu/Nr9l3DWR26UMj0Db03qmDlFr0YHi7d1qzdpO3lN8xGK6WTmIH3IS6RkAYLo6/cQkK8mGsG02E+MhDJvAqEJlUxfHskDdPeqnIFKQViQ8cJcB4CPdaZw5wR+VKuIxvNCpenIgtY4gFPjISs77vwij+OSbO4X+KyRKMszx6TG3rwE5Oyr0tnURJFo5Xo3y+OzYVz7SWgwDsFYl2TW24nDmDHsxZyoQ0A7S9kfBxVvMMF3UbujUJRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBQaFxwBtpTRgiP5jcKiU6hYBZWX5tdELGZHcKJyYXU=;
 b=Q6d4W2QBErDdmFYAp+7TYx7tGybXVwdfF6XtcuZvM48dj8agnzQ6DZmYDgmOTqCDha0wkVc4SMaQIcusBOIq2TmxIbC+aGX6B1izWuo6dXNaLieCBRe/7uHZGJppyirzLJR03Uvv0Vrk6A2DD00ypNdmhKIuCep8VKrcXUT6CpI/ejYq0yAcShRGOwZQuuzPHhJT8JlPMoNLLhFnANmkyFNEdxjgQiC3esbcTwhOOtozOpAvTO2t4Nw5ve2/2NzV7ThxTYr0wKiU+EqZUrmFkMb7AbnVVYnw8aioJBnUuMwgUKFMFiTRH1EFKMaWvfFfK1YSG6O1Wy8W3QNyXaNR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBQaFxwBtpTRgiP5jcKiU6hYBZWX5tdELGZHcKJyYXU=;
 b=lKQ5ybG1H3pfh5Xh/dr2TmNKgd7S4lovml2LYWeI5N6xWhlF6Tnl24wzeDnWbMHdEypBhtgRfyT9JTYADUZu0CuAkwoS0iFWc7cgUItZnn6/wVf5UcyPChbX4W/7e+BxVpIxheeH5vmwXntEYdkB5TLpq9c5wYfPF8EKmRVxZCI=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by MN0PR10MB5936.namprd10.prod.outlook.com
 (2603:10b6:208:3cc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 10:24:47 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::e929:b74c:f47c:4b6e%4]) with mapi id 15.20.5206.024; Fri, 6 May 2022
 10:24:47 +0000
Date: Fri, 6 May 2022 13:24:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>, Carl Huang <quic_cjhuang@quicinc.com>,
 lkp@intel.com, kbuild@lists.01.org, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [kbuild-all] Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
Message-ID: <20220506102425.GF4031@kadam>
References: <202205032236.kofEquX3-lkp@intel.com> <o5hh7658dxr.fsf@quicinc.com>
 <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
 <20220505055817.GQ4031@kadam> <8735hn9hfw.fsf@kernel.org>
 <e8b3efec-dcf9-0ab8-e2a9-b2a514a14d49@intel.com>
Content-Disposition: inline
In-Reply-To: <e8b3efec-dcf9-0ab8-e2a9-b2a514a14d49@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::17)
 To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf1163fa-a2f1-4e43-1907-08da2f4aa47c
X-MS-TrafficTypeDiagnostic: MN0PR10MB5936:EE_
X-Microsoft-Antispam-PRVS: <MN0PR10MB5936888CEB540CE541D2443A8EC59@MN0PR10MB5936.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTErPVWmdp1Elf09VPovPP2AC0FfLI1Cm3T4yIpQbKTPfaB3iRCmg+weRxVrAgbo9mkTW635ss+7duvZX88Ba7R1u2SAmAIWW8AyaAisFj6ih0PC2R3gnn85FRItoF3rkxcW7kAtRNTFz+3H8YLsiQ46LR1Fvep/9dcYrWSUVpf4jWhuCHXV9do/B6ZpyJzouC786182tq5ruyEcF28G3TYA3agwJXWBio+oOFK4JKNvg2qxSapBUDgoqou5Mgy3l4ZpSYmaX2OtZuwLQPhIlYBn70eQJAYYw6Bykl2zgCJwMt2rvLfvCBeKS88mqQt+Hm6OeLOZ+S7LRuspCAwkWAxPe9++Vzm16UbIleJr3IPcj8lOu3MbC5Fomk9Mdp9b/P9dhR2dTIApps2TfcORzXoxSO1LDXK8bpuCTcIeLnjNUugfmNo+Wi5eCXF6c5g7hNUOZ8Amxq3JrfPulwOZ4tjkmM72rMckwdDaUZyOwkPGYKVlliFNYBD7IN2GRLX9m3Mm64arT6tMrYETUJaijskt28oBWMEuOZW71JSbt+vIfOKNy8TPBkFnwWQ1Kpc4oAj8UzjfMsDIDuuhlFhCuA+/4sWFfyWYWY/7YmOUvzYLa5iuXi13crEefA6JSqKADcAwFyoF0FY0gxeCRPcaTBz+1uLAC8jq4DVPItzKZ79gxUQ24kHuXPTrgtX5isBBtPwwU3CVi699k+6hXloDsb3oq8MADwiB2+3TWhKehAhhGTAw8FiqmyZ6k1g7u4wDq54nuXbyrCR0hXy/mOLo8W7Erpp9BXv4yn2jTrrcwRNmS6fQRry0RTi69xCtHamYPNdA9iAZjDqdjzD90kyhwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2358.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(53546011)(54906003)(6666004)(6916009)(5660300002)(6506007)(9686003)(316002)(6512007)(52116002)(26005)(8936002)(1076003)(186003)(508600001)(6486002)(966005)(33716001)(33656002)(44832011)(38350700002)(38100700002)(4326008)(66574015)(66946007)(8676002)(66556008)(66476007)(2906002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USzHMj6H1XozPIC4PcNng97AM8EBq/V9ZLayz8y1xqZc8x5twJ8nK0pNjlqy?=
 =?us-ascii?Q?emFzb7drg7zhG0Hf5TGuusZOJcD1SjT0vhtV3PldELCiyV6vP185phoRmXT/?=
 =?us-ascii?Q?Cq7r7tWFBXFYDVY4l8MTFYRYUzClo+bdYhDv5CZ5dk+d1XJpoIATEYawryJW?=
 =?us-ascii?Q?L4KZlsqRJdxKdswkkK/lwYKo5bSPL2Nu+R7hu7YfzM6jlB5nPKoZOqiCcvjU?=
 =?us-ascii?Q?Z+3PF6NBlAv+U1myhNotnEYxv9WVYXBB997zfgdukOLuudOQI89cRDd/PHeb?=
 =?us-ascii?Q?DMPvSyefSKlDo9vVg/GGYzxTS7tOT8RXcymqaqV+saZl3S410yUO5d8MUaw6?=
 =?us-ascii?Q?LmwSx4tIgWlLvYJFkZApyYWodoTSwgQgTQ0+lMODiOcqOWry43iLplnxuIOx?=
 =?us-ascii?Q?HfYI30QurbnriTZINmzhrWnH8pYc0Yni6WwpYJf4zqNHYw1VMq4Ad4y9P0sQ?=
 =?us-ascii?Q?9PocTH19F0vW/k7lUpaFoCzRwBbIwDYBrQwoWeVKvWYwBNcpft7A1gWqxJAk?=
 =?us-ascii?Q?pTg2qdY2I1YAiz1OuLinnPz6lH5YTBwp4Kn1eFMgUxQtR0xvFsxisuYGNePX?=
 =?us-ascii?Q?hKbJvo0qlA0cWtxJvmrOQREh2oumJ9JkZ2DoccgCRuLFxB2ZXSCDBis4uoGm?=
 =?us-ascii?Q?ihPnaPCoEVLJZVttBppZ/3fvvQx8ioYaMyPaIJynrnJh3kSv6EluFwHqm6+e?=
 =?us-ascii?Q?nejZrdIL6fcgbr64kSasUuBZ8xLkf7/QAfbx7N+fS71+piB54zi7wAInwrxj?=
 =?us-ascii?Q?G3dig85RXnzWmeUuqbDaojP8jgDWa80z1yfAyBF+zgDfLM1iE6jkQc9/UdmD?=
 =?us-ascii?Q?/QhFJoFlYSzN9wmkBmQ0xhZErJA16iDiztGYSCSTES66b0VYl9bHDIdWQ9s4?=
 =?us-ascii?Q?5exhgAYqsLiZsBk4peFNq3iCaYFBzJh5BG6dnvJ8LrKlr5tyz1KPJdA44ql6?=
 =?us-ascii?Q?qzk+wuc/7J1Nd8dojZwkooDBGnyS+RDzsopV+DF8LOR2RLvZ/TWr4HFlMVNu?=
 =?us-ascii?Q?QRyuqiMMN+5sStHEE0uMerDh1cIB+Bty+FpEKVtuzrwHDeiW9U7mHHkT4lAr?=
 =?us-ascii?Q?yNkaEjbvDeW1XXgl9BNvBw7k/r9C7oVWkaGqwIdrzpGu2Sfbz4Dle9fwmgKH?=
 =?us-ascii?Q?R5mAoQORvuDWL2yKcK5I4k2aciMBAD4THpqGe4hBhdz+ZQxKq+IhHVxmZpQ0?=
 =?us-ascii?Q?EfcvqJjHgG8EwU/un2z8JivD6KmALneehYyV2nCOv9zaAORJp0O4osG7iA8y?=
 =?us-ascii?Q?JuD9A4JwJy6cRXmVGPAsTnTGJp97CkoMzkrVDO/3BrxuKji8qAPY5D7lv1OJ?=
 =?us-ascii?Q?3VxW/CUg8Zo2WEG8+d613nyuowCg2f4OTV5jkq1rwa3FMepoZK16Z1i4630k?=
 =?us-ascii?Q?+eFj2nm2LPso5eitZjZEEnI/f7CUdeNCY9yCbXybiG00MjMp3gXLIutUGKFB?=
 =?us-ascii?Q?aLPP570URQ8re4nME8lrS0hxdYwzJZ9R86mVBXNNevEErgvlrQg8X+pXgycE?=
 =?us-ascii?Q?M99Oa+gDgIaFFmiuLH65gV4sG7rqlGvaTwXAgpBOoCl/u2UP9z/SJ5zqqOCl?=
 =?us-ascii?Q?oF45LSqC8hGH7seWNpdTpSLUywJ/6gpUnISfds9jxlXLIVWYx3S3SSs73qi7?=
 =?us-ascii?Q?UdmgRrHsNLQOnYKp1rdmxXs9PxKLdc5wwBUTQ4Jm4Q6V9I/CPtJEnE3xjD4e?=
 =?us-ascii?Q?YwAmf+FvY1Eft4dw0ti4UuiwKNGNd57G3k2XHuaNtw5IBg+KkkOIYpyipmNU?=
 =?us-ascii?Q?hnOtZZwPMvwuA1HAggbYwwxOMcfKUjA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1163fa-a2f1-4e43-1907-08da2f4aa47c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:24:47.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WHg3Mg/w7OLrGIE7cjBaCjzT0BDamfb9DfdJw+rSoZ/LLnU7MEMtPA0xA/mVz3gV6/yS4kcDop8vdygilYe109dwDrjuh5hVGLP59fj5f0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5936
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_03:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060057
X-Proofpoint-GUID: imvIMEDlkfRHH54dw0BU4Uc0dL2IsvDL
X-Proofpoint-ORIG-GUID: imvIMEDlkfRHH54dw0BU4Uc0dL2IsvDL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_032503_845927_8245AB76 
X-CRM114-Status: GOOD (  40.28  )
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

On Fri, May 06, 2022 at 05:58:22PM +0800, Chen, Rong A wrote:
> 
> 
> On 5/6/2022 4:46 PM, Kalle Valo wrote:
> > Dan Carpenter <dan.carpenter@oracle.com> writes:
> > 
> > > On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
> > > > Hi Kalle,
> > > > 
> > > > Is the below the same fix that you have already applied to ath.git?
> > > > 
> > > > [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() -
> > > > Patchwork (kernel.org)
> > > > <https://patchwork.kernel.org/project/linux-wireless/patch/20220408030912.3087293-1-yangyingliang@huawei.com/
> > > > > 
> > > 
> > > That looks good.  It's sort of annoying for me to send a bug report a
> > > month after the fix has been applied...  Sorry about that.
> > 
> > My ath.git tree is not included in linux-wireless builds so there's also
> > a delay before linux-next sees the fix.
> 
> Hi,
> 
> Sorry for the overdue report , we'll take a look to prevent the same
> problem arising again.
> 
> > 
> > > 1) These are kbuild warnings.  The zero day bot generates the
> > > warnings and I look them over and hit send.  I don't know why the kbuild
> > > bot seems to get confused by -mm.  The subject says 408/8237 which is
> > > pretty crazy.  Maybe I should just ignore the -mm patches?
> > 
> > Yeah, I have been also wondering about using -mm for ath11k reports.
> > Does anyone know why that's happening?
> 
> We don't have a filter to ignore some warnings from specific branches,
> we can create one to only report ath11k issues if found in ath.git,
> please remind me if there are other rules.
> 

The problem is really specific to the -mm tree.  They always have
look like they're a part of a 1000+ series of patches.  There was another
one today:

[kbuild] [linux-next:master 5904/9357] kernel/bpf/verifier.c:5331 process_kptr_func() warn: passing zero to 'PTR_ERR'

That warning is a false positive but a high quality false positive.
A lot of the "passing valid pointers" to PTR_ERR() bugs are caused
because Smatch thinks some arches have signed pointers.  I'm not sure
what's up with that...  :/  My bad.  Those are on me.

> > 
> > > 2) The blamed patch came from a git tree but it had a Link tag to
> > > lore.kernel.org so we could have used that as an In-Reply-to tag.
> > > In an ideal world, all the bug reports for a patch would go to a
> > > standard location.
> > > 
> > > Link:
> > > https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhuang@quicinc.com
> > 
> > Yeah, that would be nice.
> 
> We have already linked the bug reports to the patch if the patch hasn't
> been applied, I'm not sure is it possible to find the link of patch if
> it's already applied in a branch.

You could git do:

	git show 90bf5c8d0f7ecddf96fc1cd9434af4e157b51970 | grep "Link: https://lore.kernel.org/r/"

Some of the links are to freedesktop which also has the msgid.

	Link: https://patchwork.freedesktop.org/patch/msgid/20220504090229.2506560-1-l.stach@pengutronix.de

We're really trying to discourage links to other websites because it's
not under our control and it will break.  And you wouldn't have the CC
list either...  But I still think it's useful.

regards,
dan carpenter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

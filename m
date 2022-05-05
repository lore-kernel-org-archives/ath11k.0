Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C4CC433FE
	for <ath11k@archiver.kernel.org>; Thu,  5 May 2022 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X79xI2XsQkWL0pwOWgRo/Vn40Bg34peFGNzVL8NTbdE=; b=Ge5HhhGhv0eawm
	ptqZ4mDBZ4zJJt4MrkXfj6XNOadhmdRpD2ZSO9KX/vT4ivG/epsGC5DYUIxnzeo1g/2XtxUiGoFzl
	jv47XH56gzsBagUPHpQQJtmFebisr2Q9EG/M5FxFlZNplLIdmzdfYfrWWX29s+/YNNcH0SFjuIH2U
	qfYTn1IEbq9r+wjCyEjkwewGmsFYrSGwk6cXFlZ/UUzw8uD8KCWDDFo2WOd0KmTZ65RmXnw4tLMJ0
	3dq52DW6eaSXnQcsP8bfqXLO67gBi5XgXNrPl1jJ5lDgsvNr9dTsIFRdDPfJn3Hv72ZGEDJs+gBXs
	fqIS2acQoNa0fJN91T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmUVr-00E7kv-Vj; Thu, 05 May 2022 05:58:55 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmUVo-00E7k0-RA
 for ath11k@lists.infradead.org; Thu, 05 May 2022 05:58:54 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244NWIiw013665;
 Thu, 5 May 2022 05:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=CAY0c1ZpORNLFCBtHLPPzv/pFHwdh7UPcnNdaYnBIeA=;
 b=cX+LYrScx5KlQ0kCpLsAyWKaXm3lWVz2ldO27cEjA7UR1NKh2DIa1Qf3Q6LEWqgtk+LL
 9Mel4BH1W97GBQabe7/9L4Tl6loefwSsTLLz4c0aO1OIW3CzRBMYHcdYc4DbWHIDdQVe
 2KG8rEpcH+q9QmDN7RlmnMYXkHqaRKtCVR1brZ3enQ06ZrRDjwDItqMaO1Uu4jCW6cHq
 nTbdPuQh9J+/lLVSu5e1CGNWXFttPBjwxhknpyx/1QI8kWfBbOav0mB1uCg4l9P5xOaj
 07uhGdq9dQYGp5+8fEdmt89iVkCH1vCntqsVda4OkJ9A6QufGqkcVjR4sQswOdnV/WO4 iw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsjcq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 05:58:44 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2455ewhl025096; Thu, 5 May 2022 05:58:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruja8r4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 May 2022 05:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt9lJag9agiSnptGzVUy02W14apQXjqa81YWvS3MwrXe+35EldL8toAL0CRlhfIbWR67hBQcyP3nYt3u/lYDtqe54BxRM5fjrVn4jY20xrIZTyOud7iMfTkBjtNMpO2iuhenLQ9kfBo0JAkh0iAPGGY5dggJ6Tk0L6zMx36CaaqcGhhhIgpn9zRJWrjpDEWQlI7K5LrJHn4PlGuQxH/CaE5QGIP6J6ZHNrZpdjsbquifLy2hDkG3auw1ZQMWTCvftLSztJZMQA2xVqq8gMHhgXn/s+BeCxkA4gxRTM7ms5DNOM3plEUkuogjJUy4AaBQF3rMuwxjhJNp8VCyfhBK6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAY0c1ZpORNLFCBtHLPPzv/pFHwdh7UPcnNdaYnBIeA=;
 b=KdMGz6V+bieUTP7NgBzw1MkwdPI9coRwM6co90oSu2Rp3tFqU4J07/nsvn3A1E+2ECsty7udsjKp+3HvgyaFmMGVQ92P8ru3LEW3KVnri4bwzWeOawMPaYXk2RIj4Hq4IHF9Kf3d9rCoMUFjySdxyVrkdERH7zTmLxsocmqocEth5bNpKUVcEjxdFcu64AHDH+hoxq4bkFSy4iRCQl/dZnLew47DYwDcI1pDpI7u1rOC4Nmqx5PwZ4GoFBK6BS6MqUa7wSWA8ya8h1cjJh4GRt/AsVYirTZRmff7YgiMAJ6gm5ssXz06G06xYH2E6JzN8oqUVY0hdOHcVh/KKoXo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAY0c1ZpORNLFCBtHLPPzv/pFHwdh7UPcnNdaYnBIeA=;
 b=qXZtIvnAJi/peFubXTfKsZTrq32rZK5RHja00p+P9l6Amu6FAtXO2BFtiSqgROxpWWlXn9yIHpaczOM9Y80c25w6lfzGRN7ibT4zzX2HrYgLEUS+HiGKwAqG0myXD35sAqQi0eIsghFzLXZ/Gl849+zkh+o+nL6uSBhlPEkxWIk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5074.namprd10.prod.outlook.com
 (2603:10b6:208:30d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 05:58:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 5 May 2022
 05:58:38 +0000
Date: Thu, 5 May 2022 08:58:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Carl Huang <quic_cjhuang@quicinc.com>, lkp@intel.com
Cc: Kalle Valo <quic_kvalo@quicinc.com>, kbuild@lists.01.org,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 ath11k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Subject: Re: [linux-next:master 408/8237]
 drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn:
 inconsistent returns '&ar->conf_mutex'.
Message-ID: <20220505055817.GQ4031@kadam>
References: <202205032236.kofEquX3-lkp@intel.com> <o5hh7658dxr.fsf@quicinc.com>
 <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
Content-Disposition: inline
In-Reply-To: <fd76aa54-4d05-a4b0-b3b4-11c8a5be799c@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0026.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f96aa5e-4456-4518-c02b-08da2e5c4cad
X-MS-TrafficTypeDiagnostic: BLAPR10MB5074:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB507404A6D51F60EB775D6B618EC29@BLAPR10MB5074.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /47hFTa7hA7DgljbCqxtTRF4laE8dcVVy6y8e44U34b8294KZtbEbyDQutvZp0zLOIy8wNCy3PtaUqc0nqEh9QmqayEbQz+6Fd2ji87rOnoneVr/covKWIm4pSSsaBPdo+4W5P+D8AO2GzM1ylAq2tCZhVo2RbopZrGpj+7P8952682XgzaohijUPn3HcHYX2Nl3zg2jFzzt016sv6Co6da3yhThC2w8Qtj1CXI8/KUCCpclJUzPhMwsOfHBZkwOL7Dtx3d70AM+N+IhzPxDnjHY9eFMMQwlFPFKL2KbP8jrdqNeuULMpls2/+7Rrh6wdM9fUULXoLtf0tmUMkXf7pMMFWsnTi8d5kPFwl7JbroBi88iWuYhDP7bcJGAL8MkRQr7uRDpEbfAjE0+AAavyzGxNSfY5b3SSVsbNBSLnIOmp3hlYou4J6aFavcTVyc7zzPCfjNlrePdO71YjKMBs59AzMoKr6u4XH5Fpd9roT8o5ZiRifzHVlQk+TuqofVWnGSWJJ2y5qy2OZuPXIVKu868DwjZ1ZI7opUJzNpQflZcukBeClI7F47q+ewoRrT1SVnRTeM06MkO7KGGLfOu/Uj7yGC2eTTClaQ1iZMA/XYdwhLVt2rYjbDEp3/rMl7KBHwqLlZodmJ6l1DQXxh0NcC2ZCh9GRQ9m5wjeQlA3Q9OmJMXMKbgVrf6hiWbVecGHUQKgAyY5wmpG2IsZadEzV//mOd4ibgCvvmCtEqSFSB1a2cvxwcqhVdP2XhB4kMrAcX/3hwkF7c580umGcDfDg/2qArwU5DU93a0DxjGQ9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(26005)(86362001)(9686003)(6486002)(6512007)(966005)(66946007)(66556008)(66476007)(8936002)(186003)(4326008)(1076003)(8676002)(33716001)(54906003)(2906002)(6666004)(316002)(44832011)(6506007)(5660300002)(83380400001)(33656002)(38350700002)(52116002)(508600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wP+s0HP8L3A2K3Hw4AyB+oxGBP0DKucgjd5topciilczu5CXm++mmX0o5QLm?=
 =?us-ascii?Q?mPtNq8gBagzz1BivhFccRDP0WAkl1w3Gk1zGb7oMf/ZSsDfW3uya9JbrB7SB?=
 =?us-ascii?Q?0VIu57Lp8MXvZaoaTWBxKD8Lm7QMnwiqRAjC634oh96L4cFeYAbCIObL76sT?=
 =?us-ascii?Q?TZ0pQI5z8y3RppnP3Vzx3pVOXDHVda58wtkJc+owiSmIhCxbU/cz/qOmAUHw?=
 =?us-ascii?Q?EHGz05wuESFSAuCP4xWsfkNhpcw2n8QAaKbtIxaEUEcz/lFf5J7mwQ37N/VV?=
 =?us-ascii?Q?YhMvPe5T95q8fNn1R4TSYGs0X3YDdidm+tjBgJc1Flm/P0N/wH3kbsKewQku?=
 =?us-ascii?Q?hjF2KJa5VyaQb926gFwKNpitcvyDAEHJVfgnKRXnL89DhpYMqofu0SRCkNm1?=
 =?us-ascii?Q?woH8yCYVAxNmj29n7BtNF3zaGrPF4ZFIOcht5IiDlBDspbAlGRXGwF2B91UD?=
 =?us-ascii?Q?T5kJsXeDvzrLkGsVvttCt7R3SW02tny5D0PBaxkrAR7j3n/BUEZ4AX8OQI4g?=
 =?us-ascii?Q?0fCxqSAB5jziYIkw6ETHO0Oa2Dcc3CZfQwT7O1tHsrMi8ezFAsS82OgsV/sx?=
 =?us-ascii?Q?GFxI7jSr5+k7pnbyyVz4iYgzAjifafigZWiWt1pBMH8qvFEgVGqlPBFFK7H9?=
 =?us-ascii?Q?7SpiMKhueQp3Fjfl7Mc16yklf9pOQhmP5ep5c7apiaD7gg0PKRbY94ZENu2v?=
 =?us-ascii?Q?3YIf5k9/0bbdv7ZDx69pUHqahO8f5/5TzKljq6BhAoO1ro4RoLtf7gQmn8wC?=
 =?us-ascii?Q?wdu13CBlCNffl2uUKeNqVLnv6YTMSW9ucwEDywGq3A00xWGdA67Y2byvCNvV?=
 =?us-ascii?Q?iTxEb4Ml9rOKBcSy3fSyYYQVvHnoGuG9pUnLGjocyWn3hQNByR/Pijj6xawh?=
 =?us-ascii?Q?Pn0dr79SPGCijpgFQlkhUq32z4uhujz4L6JwkchovrWZNc2c4x3+pduv82Jz?=
 =?us-ascii?Q?iZuZmUIMRWLJJxsyjltlG2Mf9/0iCUW+G4GGWeZQCUuuhDljvVrnWTGB6zSb?=
 =?us-ascii?Q?YHRirIR4agDV+0f/Qe/M7F0vBUdawgahWeYCuorxEEWAXVTBOC6MnLDlE25V?=
 =?us-ascii?Q?7e3BQxPX7AYvYFwP4qkapCWmuo0/uw51H1E6jYHEAUZ+1h2IPHo4jIqqf3Ng?=
 =?us-ascii?Q?8TzAZEr0hxQZ7otkA37pj6gomLTd66eQpURud9jCo/8m1+P4hOsUxkUIkeNf?=
 =?us-ascii?Q?F9qnQzt5DRiMmR8eedPWARhgSN9wu/Cf0xgw17abN+0+4DR1cezww/sR2IcO?=
 =?us-ascii?Q?JoULqrfLBIl7JCY+sfylC2xfAC273tmogOok0GV1EB8FnhZkvd3ncrg+7Kl6?=
 =?us-ascii?Q?pMvPyC2+jigYRHUxMho7fk/QPU4xw2HS5KG05Bf8dxhsLH1EAGs9QKub+bmK?=
 =?us-ascii?Q?loC67sycveSjv7WmIwRqXxq9HP/8mrCel6pKZO85Vmsl/rEGR7SRc5hBlKVP?=
 =?us-ascii?Q?CJaHNtZVUiFjyvVUt6NeRxGGHH4S+RW1X7Yb8KCkuRawRqZlItUiMt9D/OYw?=
 =?us-ascii?Q?DQIQNONKyftCqQZsXpqIiSTx+amO0OO/COmJxYoempYrbyNyM9b5BmrPPXAu?=
 =?us-ascii?Q?VuiA5N+LdkT56wMrJ4Y/prB2GecexBsQA5GpY5qhEno/JtjNKkexuiuesieO?=
 =?us-ascii?Q?l/0HkgMV4NdcTZq4tiQtSgwPjaQFouXFiL8Q+4tCW9Vk2DEU3vetRyRS0g85?=
 =?us-ascii?Q?IvPxucr2AuKcLsYjFTlv0HMmCdk+4TmTSdRPwOQPGeoKHWxu07Yt+RlclJ0p?=
 =?us-ascii?Q?DC5RGiP/87mJ7RgyM4fW/qT0Hf4MRyg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f96aa5e-4456-4518-c02b-08da2e5c4cad
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 05:58:38.6389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJak87OOnAKkkxQTdya4UiL18itEn5xWNWJE4VMOaI89RAQeZpDb7+GDowP2GhgiH1U0Bjh7Ldv9P84vNgM6yfMjGHUt/ge2Dy4z5wIG7W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_01:2022-05-04,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050042
X-Proofpoint-GUID: -eIF7HzpumwdIKUNeR7nEbga7Sd1oc-G
X-Proofpoint-ORIG-GUID: -eIF7HzpumwdIKUNeR7nEbga7Sd1oc-G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_225853_249488_62EF66B5 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, May 05, 2022 at 09:29:40AM +0800, Carl Huang wrote:
> Hi Kalle,
> 
> Is the below the same fix that you have already applied to ath.git?
> 
> [-next] ath11k: fix missing unlock on error in ath11k_wow_op_resume() -
> Patchwork (kernel.org) <https://patchwork.kernel.org/project/linux-wireless/patch/20220408030912.3087293-1-yangyingliang@huawei.com/
> >

That looks good.  It's sort of annoying for me to send a bug report a
month after the fix has been applied...  Sorry about that.

1) These are kbuild warnings.  The zero day bot generates the
warnings and I look them over and hit send.  I don't know why the kbuild
bot seems to get confused by -mm.  The subject says 408/8237 which is
pretty crazy.  Maybe I should just ignore the -mm patches?

2) The blamed patch came from a git tree but it had a Link tag to
lore.kernel.org so we could have used that as an In-Reply-to tag.
In an ideal world, all the bug reports for a patch would go to a
standard location.

Link: https://lore.kernel.org/r/1644308006-22784-5-git-send-email-quic_cjhuang@quicinc.com

3) Another idea is that the kbuild bot could search lore for Fixes to
the original commit and include links to those threads?

regards,
dan carpenter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

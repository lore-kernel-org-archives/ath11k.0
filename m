Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6072BE83F0E
	for <ath11k@archiver.kernel.org>; Wed,  4 Feb 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=; b=KekS2o0t2tPYWsYVQLtdJO3j2v
	+4f/T1jHvmTXBlrSpxsleKcuDXcbR8rOk0jj35RmOx31UfqMepkCEiw6ppczn5JzmTrNV5qgkC6hx
	GwVh1oQ41aD0Vs/lRSa/tl3Khc4PN8DN7xdfNECpjTZGauz+MvqGkRDm5e5sPgaxNubv2G5zoSIi0
	ku4JOif1uvQ10KnuOujJRLuCaIyT9DAp5XmXGQSgPBm/Z8Pgs7CaIDT+MrUv6oxJghBz3XEldNcof
	dcYlrTKMaZJZ42ASSZRs7sEygkdi+0PJX9B3C8kKsXJMmwqA5ZqeVQUhKbFe/XA+Qbt9uHlqfTxPU
	0kImPHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngvo-00000008sAB-4198;
	Wed, 04 Feb 2026 17:44:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngvl-00000008s8P-0P2M
	for ath11k@lists.infradead.org;
	Wed, 04 Feb 2026 17:44:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CJC3A900484
	for <ath11k@lists.infradead.org>; Wed, 4 Feb 2026 17:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aHsrfprZktYuuOp72nS9bgf3
	dwUX3nERmaLiQO3UzGU=; b=iAP3aTjpKyJyVN9ovXSP+zd1s4LSAcOI0bJXnCAJ
	J7mgXhjkuRPJ8gxgYS0NmijXtwu6aNgqSpqmPFsYgJCp+iJQaiL+rxHSP9sR4FQB
	HeJYGBOXR2VTJ7bDrOUPgibrYM5p4e37bMTVS28MMwtz4sc43Fl+sanXPuxZqID/
	xsq5Y5I0HnNOi3W4GDT6doIHjhHmHfKNIX6Nij331p0KyHcPRSsyb+IkJkP9A1cH
	pOUqtmmYDLHc7IgHXaJIfi7FOoaJup+DBCvVjsjVMCGB4zndmqyqg6NJdOmLODeZ
	cLEZ35X46RVhwVGbwtcerG/VYsBBd9CjRGah+g7vo+CfSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445whd17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 17:44:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3e7722f1so95405385a.1
        for <ath11k@lists.infradead.org>; Wed, 04 Feb 2026 09:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227082; x=1770831882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=Tbjeh/aGSNQTRtUDgeGyeEC4osZk28GfD4h2j5+YILue8fSxs6tzF0O2/KjaGPqL4v
         DqlvD1smBqKIxBSfT+zwB1Y7xYRsthAxQ2T8CitCBI2k2oMGLBgs4jeEHK6th7rVC3kI
         MqbinZho2U+zH0mjlp6qpNmtqXjcxm51sfOTwvJAefykFr5nnxMQnk6n4IsxvZNVi9QN
         NuJSusIs6lAqx2zv6h4VPZcyusT45uJhlV0Df75X/2FgvN3jwjePXM42+0CQ35ahC62D
         RCn+Y9G7gjGkumPniXtpJ7K+5mjLiHpagsqfD2jhHdrgY52himULsw1WkizJYC466L6p
         qSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227082; x=1770831882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHsrfprZktYuuOp72nS9bgf3dwUX3nERmaLiQO3UzGU=;
        b=OU9MX0IDRjRFbqi8w/pdd/kSnS6NVmlmBwXnzjwPEy74kMc3hs4hN4uu5nF8Jx+BYV
         Yc9eFGepV3xttVjs6djl62uPS5a5ireG1uwmOftywHAcunCJSVpsVOdLkB3dNsJRKyFH
         I8O8Meua9b107P5pK8jzPZ5V9jwTNRsdlfqgsx54hR/+cYMsojVjIsCha0Li8kiQIkEd
         6rH20SGDQ9r/P+qGuKUi2HF385E4kID1Py/fvmwLOm1jDhjITMaSsijbt/JRoe2dlp/I
         Sqycw83kirdsbWCF30IPX1xnoDoeFuLtGSc4SKg9E4gluUfmcouow0kqNZ5EqNRPjUdG
         FAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXlxXAt6dNGqB6s/SuqeO75dHcKJ4uXhq0RN0L7nQQdXrKyenyoXzLDqUYsW+3CZirJ4C7R5Q8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxupm/rg0BsJot4Hr0NvMjg2qF084yMeZk/iJmuuCdQoSeCW99k
	U349W9M2eQ8qsPoDTgfz5D7skCCstx4FlQanZGJ9ErTzSRxQuD02uduSRN3HMhtnJcuJQK4Dto3
	Im+2GOA7faSKpBWtdcEaYWjAb1/Ke/8MY78qP9AnatecfD4VLxE0lRAFB1fGwTJdf
X-Gm-Gg: AZuq6aLREekcGN2hXH2Fp+zsAmJ2ZySFD0TctKvCtmYqXoCrQQsQOCpk0zPyiawD4ql
	deLDw76E4rmFC0WuebjkUN2eKrrBxfGCzbWmvPr1l33+x2m9nCits+n+Q+VnvQvHw48v/P8B9xZ
	x/jUEYOXJpvtUlb2JsC32VB5tt6pacADgOyMSm+BcrGfY0DtgWzy82gpRCcYG38EYFprpdqorIL
	NDcztX4sXF2zLC22I5WK8f5wBgdVcbU9FuUGEDdNv5Dh/xlEzCgMuIta6XT2wXYnBvxG6hE+ysx
	9JvcwxuH9lpoCPycmfvsAFzij0SfBvPsnVRzwSwBX1cwK3nF8MBWiOGPHGG4AGCUGH275YRtk/d
	iT2pwpVdLmLduk4I+oyJTsijWNQd3YHvrwkVP3TgTIChAX5Sj2Zv3jk1BUSQ2Um+/CRhbLpVQSo
	YD/sii+fn/bgdwocomreISIsg=
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18078285a.32.1770227082496;
        Wed, 04 Feb 2026 09:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr18073985a.32.1770227081991;
        Wed, 04 Feb 2026 09:44:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3912f079sm671349e87.44.2026.02.04.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:44:40 -0800 (PST)
Date: Wed, 4 Feb 2026 19:44:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260204
Message-ID: <f4smcbpxikew7b3q7jnhuvojlhtvgql5po46xtcz2hfgsgbllr@a47zk2likq3f>
References: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfXwS+QeIuf9grx
 O85wNRR6gsQJCRQb0uW6TZLJqzMKGiPh7arSHDxrzPIOJ7G2KADQeAtQaj2ulpZexVI562UvF9K
 3qDuusqPMA9WaueWoONFc4OcduDwE8E9nK53TDz1Dovwt5/eGAgQTJLNED95TVla4JSYSlF8nVr
 BlZtx8dhbebfKiOWxELRUBwa/1kaQzfWVnLWeb/2yH/5fAGYtsLyShzSNG0g9ydCQqPzatemg+b
 XUEGtoHIpNzTaqa9sqvbU+E+aYVg4tprxVCHtruMPpUwPozQFWQlEOlgXBb0HL/W9NM9UIus+me
 3DMtu38I3HCIcYCo/sHxTbS0O9oxMeTLJWizR2mq2W12mkeBydfK4N4OMzvFu7/aR666LHScPUw
 /JQkAE4szgoIZnnQcDNsYGX/Aqei2KYCPsj9usewIblEwHzSBtAJ0RLdugl5DUsh+h52g2nCKMZ
 c6E8t+rRGNs3Bb0rUkw==
X-Proofpoint-ORIG-GUID: Nv4i_UKavw4t2TlCu1RIBLgQmzdnL2gD
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=6983858b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=OQxrAGhQEmtJb-q9RkkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Nv4i_UKavw4t2TlCu1RIBLgQmzdnL2gD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_094445_252878_E06F933B 
X-CRM114-Status: GOOD (  19.54  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Feb 04, 2026 at 09:18:03AM -0800, Jeff Johnson wrote:
> The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:
> 
>   Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204
> 
> for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)
> 
> ----------------------------------------------------------------
> 
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.

That was really quick, thanks!

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/906

> 
> For ath10k update board file for WCN3990/hw1.0 to support:
> bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
> bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch
> 
> No updates for ath11k and ath12k.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> 
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry


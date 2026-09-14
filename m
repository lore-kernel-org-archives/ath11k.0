Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E86C88E72
	for <ath11k@archiver.kernel.org>; Mon, 14 Sep 2026 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unaeFtXbw5/nkCmiogEEEYBGyDsYb3eZMTtNUOv+ZZA=; b=YRAMTGkW7wQQcRip9LZPUM9hWL
	vvzzyg9fi/cBT/491q1LTvs+PjzwprCeWkMSOeZKa5v9qcqsjLoDJxvt5T7XGB1jGFRx80CL+n1cA
	Cb9UsbstIyvKEuxM7a6MaEfJlsCXemhhJdQv3J+6wPlSFfHjKfRWZqFFGRHEvB2lx/sbfFhACxLUY
	aZ6+VxXhcie3kcAKKHP3/IsJJVL+cB9IE4jHMgfzRhaqSE1zqgYrY4n1YbppjfqqeGOi7oAtyh9OU
	mS08QvNJDB/4a307XVXllc4awYPM9YX2Idbp7EsaYWOFMv4gnwto8ZX0lTGeC0HLw2L91igyoPJUk
	IcQMLbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BhH-00000004Tn6-1JYR;
	Mon, 14 Sep 2026 18:46:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BhE-00000004Tlh-1fGt
	for ath11k@lists.infradead.org;
	Mon, 14 Sep 2026 18:46:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EHrNF94090513
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 18:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	unaeFtXbw5/nkCmiogEEEYBGyDsYb3eZMTtNUOv+ZZA=; b=bv29eTBqKmBmy5xR
	bKYROg7AkSFE5e5NsNya5H0jXybRrbEM+yZ+xLOECbgVi0RjE6E7kUya8a6AapmD
	imgOxmDIloW3xy3RZhoPjghgfL4a8T5m01ZGzWZdoWMV9fRsuQIo/+Gdhm+OjtLs
	+LhNNQaU9HTukydmkcWndH9eOBUAT4+YZGKQEUQrDennMH/T/THFz2fGCsR39A94
	7xvjhOGEhW6UDBzlIR7xvfoudCTh+zIVfGCR5hu/Wg89jxCWf3WUTGVHdo8IZE2f
	nrhg4PGcgChp4xOW50oza7eYjOip3aaOUBjQbA6VvN0TexhJMCzW5m7+tj+VZXaV
	ZsNDAg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg2nr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 18:46:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso45639935ad.3
        for <ath11k@lists.infradead.org>; Mon, 14 Sep 2026 11:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789411587; x=1790016387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unaeFtXbw5/nkCmiogEEEYBGyDsYb3eZMTtNUOv+ZZA=;
        b=XPbdW03y2t12vqWMXo4dslPweIiXFL9B6+MFYvsHt3RCdgZjyH3WBGFyeEqz5g/Tl9
         IjQtJBrPHQI7D1mlbE6VmqS40xGaL3o3OgCkRzo/0bcQqvS0vb41kJwDwVqQDq3DLA98
         Zfz/TSZ2kOk5Hx/vSXhz8TCF/K3UxQh1IYgk3vJoyMKMkMamGyfuPkbgs1EIVStABneS
         hTliFssL2COJbw38MHMhPltCvt1m3L/wnWlEMyM5ab72cjQ8un+pqVsWrZqA85wufLf6
         qIjS2olrDdVJRUsJbYBYIVrs4UHzDPdHTqZZZLj0+UMfjHSIetk34M0fhf+C/zj6lw+a
         vHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411587; x=1790016387;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unaeFtXbw5/nkCmiogEEEYBGyDsYb3eZMTtNUOv+ZZA=;
        b=Jv99aG+YrBTYUVPLiMDEJSZA+boA8bckjbC29M1Xh3JAydzJ4NcA4Suko1egAg0ZvM
         43MBz9KmH6Mlt0OAP/ILvUoScsq5hMlZ+MgqU9hhbXTMPG3g6m9m2ECNpZbEW2clGG4i
         1aSDEdolcsoTcjFhbZI8Z+QPZFv5AFFhBAyDSr5Y7y4zw+WGo26qOp20Usivyfav7JKN
         g2vWSKT3GK00sog4XV9X3Rm+gkBxHZeGrP/iRVp+/hCs1ARLbcoUBeBv2JfkqF7Usi3u
         QtfGSL2yw0TWLhWnZ6lM+svQdXrW16vxy5865aAtaPm1sq+/SDBOfY9QEjCIEVSMoCG2
         dJxg==
X-Gm-Message-State: AFuF++mbSrL5yMl5tEdCD/sluZbRfFh45MlEYpKsk3bOBDBpOlRvVUNV
	rPUyMbH07+T1ltdhHa2+bB6RZ93PImxSnH4ymFc0q/bj/6CxPrk11wQnvmc32Akwa6YPYxFi8A9
	OHX82mvCfrffogRMnNrat7Y2VuIb6VMp9GkNAVq8LkCMGtQPesqOPZ/fjKqUfqE6P
X-Gm-Gg: AYBFou0hdx/hRz7PhcT5twdAZOobiHPkoGIUk44f5OhUlpshLefcEdRDc+MqJHLnKB9
	YbruWWk6j7NDwAvYBPNEzL8qpHaFRBqxrrqvnpZNrq2ZqnwngUwVtEecszc7W2pITvah7uIzpvu
	lFcepIT02pTrpH/UDbQ1Kqax9mY6TMUEmOcpSkXhA57W5yJf/9CNJZlsei0TT3yQWKdnuLkjOxH
	ggLw/2ld0LRq90TVft9bzjS7MQQ2hIhi93qXDCQzLv5ak6FlZTGt17Ucq3Ww9c3nScFM1+0FwA8
	oe90MwrjhdPXwUa+ooNn8EDvL4bMDtgxYR4j81IathVAbFmK9Tr7zquJMajuzCy1n8NwBsOPRrJ
	/Abn5Xdo6YX2dUwnFwv30/MxHIYOgW+SLF6z6KzHYpcsFPRfTne60Lu4=
X-Received: by 2002:a17:902:c94d:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2dd6c6db162mr73206015ad.10.1789411587223;
        Mon, 14 Sep 2026 11:46:27 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2dd6c6db162mr73205305ad.10.1789411586736;
        Mon, 14 Sep 2026 11:46:26 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f06423sm32032524eec.20.2026.09.14.11.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:46:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260731145830.769811-1-nico.escande@gmail.com>
References: <20260731145830.769811-1-nico.escande@gmail.com>
Subject: Re: [PATCH ath-current v3] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
Message-Id: <178941158566.2896945.16894066499695332359.b4-ty@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:46:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa84103 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5_m9DTtpo_CcFsMShjoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 565R6OmWPlttYvsO92G3dbABSwxCGulG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfX5zExoDbnb55Q
 PREahbz2AD/ULpUPzt5VAVo7hunqUblx8x26HqmgxDebEtCK6/0kG29ETeeg2Yo6N2ps6QZLKPY
 il0sR+0Eahi/pIQsH7gi6JWu5Q2dimA=
X-Proofpoint-GUID: 565R6OmWPlttYvsO92G3dbABSwxCGulG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI2NyBTYWx0ZWRfX5Kz94HxoqD+A
 Dql0K/CAzjkG+WDTm6a2jXt2f00xA19SI8A4BQcolq5tVvItut4/4leiVyzFAketxrDft4NTBsx
 QLwoNhsMNN0XC3QG5L/63s8nhK6XtySuu2FGopMCNsL6r//jLP1k3B6P19XO1RyssW04WQZPhxa
 OKgIY+Mb8eD4sy+YHrpF0wxAf7RRVHf8m31R8nMlCbDYQvx1MrUIrYkP4gOdcRureD+w3Vn9WBU
 V+UrPP82U7HQy/pHwAXq0A3YpGwsT5b8kRQfcj+0QTjnROUHhfRwOGczaHeW4+VwM3a8QC2abJ4
 96cBXPYqM5sZuvwI0Cvng+lK2CIoZ83FSmeEXYiV+MISWCLztDuJWy/RlvnYjY+gf+eKXetMXGd
 MtUH8pJrK8QUcF6wQFV3nH+ZeNgqkihSbdJOJTxC5TdMel+rp6IzqPRosnbJ2UfrUtgeLmlKmzC
 Mpe3R5/EgpNEakWJPpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_114628_445411_53A0F2F8 
X-CRM114-Status: GOOD (  11.33  )
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


On Fri, 31 Jul 2026 16:58:30 +0200, Nicolas Escande wrote:
> When mac80211 removes a sta, it calls .sta_state() which in turn calls
> ath11k_mac_station_remove(). In that function we clean up both peers &
> arsta related resources.
> 
> But when the firmware crashes, ath11k calls ieee80211_restart_hw(), which
> assumes that all driver related resources are cleaned up beforehand. This
> cleanup is supposedly done by ath11k_mac_peer_cleanup_all() but does not
> in fact free arsta->rx_stats / tx_stats.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()
      commit: 820b8cff81c796ba20573e04722ab62500713f97

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



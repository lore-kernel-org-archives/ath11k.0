Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29C3C5475C
	for <ath11k@archiver.kernel.org>; Fri, 16 May 2025 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0svL+8Yfeg+vJiix8AzKhUs8Lq4dqmn7QH+/xdemwo=; b=qXMYsvx0zZG9YyThKA+Ik4th8p
	+Me6/T9c4ICvOa2GKPX8TL7n5T1mRyCZq6nxdRGM4PJz141aTeh2CenPNQVsUz2GTnL0ywa8Jo3x5
	mmWKoin9sau5SdxltN0Lj/5qG5dbHK+D1//NaV+Seuic3IAHyHPNjj4Gs2SB8PDM62fRt0UceGfR1
	anin9fT9mGqG6JdLjCBJzjDobW4AlLC6h/HauIXRn7+BbvXvaNMegk73otpGWW22J8atsxbjJQpdR
	XRkHb+ytrXXsCxa8sMMRYEN38wK2AmrKEDDGcXv499j0L5G/GXOYK9r35yoV9rUreIG8tRdhEuRI3
	WnbrGevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG01t-00000004MLA-2i6s;
	Fri, 16 May 2025 18:43:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzsh-00000004KtY-1UZ4
	for ath11k@lists.infradead.org;
	Fri, 16 May 2025 18:34:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBpIZU014763
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0svL+8Yfeg+vJiix8AzKhUs8Lq4dqmn7QH+/xdemwo=; b=JhcQeGgBnVPwHm0K
	nqmnDYrEUMdwqOlosGD588McBjTdMLNQpL7Xz9am2PPVrJl2illbMknGVgZvV1xI
	INOhZtdhKHYxBGAxZJwrxfYBF5XgNCqMxR3bV2SAZ7nvZ/qKvwXDDgY7AtSLPj9F
	KZUKWJJrTY0p3MWQecMjiJ85qJHbhHyda1tOii/GbG4gtfdU2TYuQ3PniMvpvYB2
	zJTjsvS86Y21GgaWRNJLtmPsM2KI+Nc6s/vrjCn+6acZ8TrGe+6Da4qlsF1+5/ro
	ztg5pCnnIOqJd1sT+jUp1q/tzZZFcItcP5S+hZ08l9Y61ywUmL52odWU0fQTjf4Y
	iUqb2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpk1c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 May 2025 18:34:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e0e8ba948so2486023a91.2
        for <ath11k@lists.infradead.org>; Fri, 16 May 2025 11:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420441; x=1748025241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0svL+8Yfeg+vJiix8AzKhUs8Lq4dqmn7QH+/xdemwo=;
        b=JyiWnmXXDD0AXhIkIaFtXlhFOnTXJX9bmIxy5rgfcblQQ2Am6whR4MgcowskDwTLt3
         7LzbDJrB0+Zv0pT8a7Lu+fn0V86mWsvmUNHBEUYqCOoNYWdvHtSSrA/nBWvf6f8GamIR
         s18u1yYR1/mdwxgkpjeCqiTC/bEXxNVX6gyf7hf1+qGPKZvf+MMNBlp7tncXjoYoKs7n
         txf8DIf7nI9C2q4xn4XFPzq4lWLPnJXX5eQ7Hh4ofd0oWLI7L7CXimdxffh0ytj7alTl
         ylN6QsOmi2PxfYmvd9MsZha9/mrljiGygDSZF03Vegn+yGz1YQ52goLsLrfPlhzZLTtW
         c3ow==
X-Forwarded-Encrypted: i=1; AJvYcCUc/HmlK5Hz0hUMRDtYKbS3Sf4Y7b6whB4BqdnTO6cCuO0RW7IdAhxcoei+rRuuEDiMYWw2UUQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzugLsIjd3GEet39qzj4v89ApFqr3t57Qea813+Izgj//9jmozx
	l14sqGTRhukccZNVra5o2JUcRZd7cSZY1tCbwevA2lb3FR0RAHVtVhdaJVHXZmtvbRnkyTjIbkQ
	6PouuYmvyoQdsPnv/amsaHMGp6TjeaxnClvPIuXw4aiEfILGmpea20G4A1zzFw2+c
X-Gm-Gg: ASbGnctcoyD+7IKRpiXOqSSpgIUVbu22xTVBWwwiX/cd46MbsQMSzftlUbN/Wpreagk
	ZxTEznSq5/+P63Hza1/xnm7h/+IIPVVEigaqY25bACXPjbN5IABpWootqRpbbzh84QLsJ/ZFVQQ
	rRhu5oqLRuWfEXtp4mBvgyeotOkSzdcjaGAVw76hXbUiZ5Wzm1Mt+Sl0bPVD3DE5yP2fCXTLLp5
	FjxrqAw0P5Y54kweN5ahAyRTdQ/zJMOWGKUI2vdf+XPivQWvNKerCZ+6q9NIsziAT1gAPxL3bDt
	VzPwS3VKw2J0PwSzuauOt+CEeqaSRYT2pjuz8o/SDlzic5fT
X-Received: by 2002:a17:90b:33c2:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30e7d548c90mr6850107a91.15.1747420441010;
        Fri, 16 May 2025 11:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDN0c6qarJQvD++Jh93GB0pXnmRuirKipjsMNV6jsu1UQrfj/SFWZkZbDZFNWhmtdcINcZQA==
X-Received: by 2002:a17:90b:33c2:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30e7d548c90mr6850072a91.15.1747420440579;
        Fri, 16 May 2025 11:34:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:33:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: quic_bqiang@quicinc.com, Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250428080242.466901-1-usama.anjum@collabora.com>
References: <20250428080242.466901-1-usama.anjum@collabora.com>
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
Message-Id: <174742043941.3092151.9479454399125527127.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:33:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: LCJnS0Pqd4Ysg7lwrk8TrFY9Yq_ti9D_
X-Proofpoint-ORIG-GUID: LCJnS0Pqd4Ysg7lwrk8TrFY9Yq_ti9D_
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6827851a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fqv9DNJugNdUxR9BDUUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfX21fGpBRF+/OW
 ZasbeObB+cLiBRh0e/SeYkvfQKauV2F/JA4xKRIPvl+FfdPUaW9WVnIParv6+GRk8OlvRaFAsRs
 f8j0gdsIzEc+xPmeTMQ24sJQ9zuKUO8hB+gU+6ywtkq3vjyzxRTxSOiF7Mtmr+RYFMsLOAJq1xj
 40PqVCfQ1T5wMGIF2d8sEwsMxc8yzRPuFES1BiaPXrcO7eitDohBEGiY1Mzh0NCrnBB2VIBhbvB
 2ErHrfSs4vgM2WDWWspEoAHwYkyRdymArUtVPGzPxC7mjZL0DVYp/9UZpIeaLJAfETyC7+EGDFF
 kYvOWDjXnMIC5vvgJLQ8YyDYbSfK8sXDG7trdYF1c7aEU/Tbl9ahEhhkIqnp/ZfKhrEYLGejmdF
 JTcssdjjr9xueGSZW55aAj5uxWf0qfGqQShPh4YtsSyFeyXW/CnVw3lGPpuQ1sXOwHdWjo0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_113403_408313_612F2006 
X-CRM114-Status: UNSURE (   8.13  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Mon, 28 Apr 2025 13:02:41 +0500, Muhammad Usama Anjum wrote:
> Firmware requests 2 segments at first. The first segment is of 6799360
> whose allocation fails due to dma remapping not available. The success
> is returned to firmware. Then firmware asks for 22 smaller segments
> instead of 2 big ones. Those get allocated successfully. At suspend/
> hibernation time, these segments aren't freed as they will be reused
> by firmware after resuming.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix memory reuse logic
      commit: cd2e7bae92bd7e65063ab8d04721d2b711ba4cbe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A6CD4F49
	for <ath11k@archiver.kernel.org>; Mon, 18 May 2026 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbs/00sIy0HRUS/VzxcZvFVipUwRNKU5yzSk8ZCe+Cw=; b=4gtmQ/IQqN6pmhrL5NPqaaIVHF
	w5MjbMgbFICuEIMH8QXxC/XJukyB6cYM9xanoaYYOjgz2zWeS9/QIzYDSFz+3oeXI+/cAY9GXdVir
	1kvqQyyBhJI4oJsMNeN7woPBHBB4Ez2Bkcm16UI9NVWfyT1MZwu+w/IS/5CTUh1NHSGHysFh6zi8n
	YOYnjMmSbt55R2ogaIyqXFkYYFdnC3pxHORG+fqQr2KPx1yITH2UmrLCbtpodl5Wr/0RyA+SLYu0N
	EK1E6BJprPI0n7Oi6nyBZ+JjuaSSIwJs49zSNTOga7TLLZnA9MOWvcayGSrFsocILMvH6lB1ZxwWz
	yfTtgpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQI-0000000FsxP-2V4Y;
	Mon, 18 May 2026 13:54:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQF-0000000FsuZ-25q4
	for ath11k@lists.infradead.org;
	Mon, 18 May 2026 13:54:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7cNd4353033
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbs/00sIy0HRUS/VzxcZvFVipUwRNKU5yzSk8ZCe+Cw=; b=VhqQMg9l+Es1EhIP
	EQyDzcmaXqmpqTuJX+4NbcdHUvAZK/nEGHUYihhRScCfQAE6VarU+6Ef8XwYY0vp
	T1wVBxC5Epsd2mUPdb9Vk7ChQsdtDVKtqsFqMDg18n3TfhnM4JpVJ9nE9Vm5fgzk
	SHp90eMCsMM0Z5+Ke/UHExwltx45m1NadKA5Uxlfi0q4IvuQIqK17+Mt3guxTviD
	AcTkCFXXWsrP9/Jfd/rp34hpdGB6t6VLCDwP5S5ePw0S+obA4XwWHVJvMvlFAlsA
	GwnE5/xhmC/d85oIuO/lytCJB6Ow5yz74UzBM3yN060vSPDiwQlzXRNfK/J7XGyV
	dn2jBw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjahfq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 18 May 2026 13:54:18 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-135405e4035so9607705c88.1
        for <ath11k@lists.infradead.org>; Mon, 18 May 2026 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112458; x=1779717258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbs/00sIy0HRUS/VzxcZvFVipUwRNKU5yzSk8ZCe+Cw=;
        b=fpMVsrCDLUX1iTn3SseKTpUsA03c+/VOOxTkdJ3iSatKOad86neABuEIuU9NPmaj1F
         1aY22MFWI9v12yOFLuP6kVhoMNhDveCK/K/cIgy5u0XZQmGXwGQS0D8yo36wKjEUtCTe
         HsSpjL9GIbiVG+okbB0Y9PdiGRqe2YaFKkW8LMPw5AgaealPAMWRSsQTR9n8H5jnle53
         J3jUagt77iYoBX4TlaVcbJRU0sc8CwxOkbn1GpaKC4/ByVbnCWZbkCtnnf6XzRer+2mf
         LLw0YaMF95YKJtteJE0f8tkYtg2fswfZp4Asoek4MaVTSbv6RfeIFusxePwSVWFMooPE
         2fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112458; x=1779717258;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbs/00sIy0HRUS/VzxcZvFVipUwRNKU5yzSk8ZCe+Cw=;
        b=eNLHU34TMJTdF83X+h+VvN3En0hJXNDUXmGRfUrZ4bQqBi8hzpMvz+jCHseAETZGgA
         lN+T7to+7QhObc7fKZxABqQiX2JkQ4rTDF7uCsKpMjWct54oN+IUO/S9CUFcOP+mAJBW
         iGICWu4tbbYD6BG8Ty0psEbyEM9h/paJczRrYhwxAu3tnViNbeUrYC521NsT0YMw76r7
         Dtz2Cy82iRiAct0hbrDRGQXHNBJEMjlxu0aZ5VTW5rML+oIh6s5L8F1oV+bKkW5RYY6/
         8zzsVFlJVQdKSKLyZrubgBAovCjP7AMOlN7Mnn6dmLxGe9pxptw8l2B+JBs0ZE6fl8xc
         2ktg==
X-Forwarded-Encrypted: i=1; AFNElJ/HMhwOjidjjsgc8OYiL1hcetYTMkOXdeKPKxiL/pFAU9q7lfqMEIgCQj9wrwB7s8gpyFsyTLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YycNC9mk0AGlix+3qScw0aZYrPMqg0w5dc1gFUeFREq1C+/hBft
	G4vh9WAecllQdOijVSWv76cOAXDHddogE1qOW686tM6vP/rQPIHb7nPHXK5Ccm+5VOlJu49AfRR
	56ynOIp1fnMnPFYfPBca1FwQa7hfbZn1qSg7S1w9Q5xp1n3z4mxoCbPPRFU3LxFNV
X-Gm-Gg: Acq92OEcb32F2oJ9Dnqzee78/gHlKH2KGNhvHjeujRMynWBY+Zgmsn8pqj19/qmYe+h
	5lvrhJYjQvB1Iy6Z+ZoGwALIJrWk3zmLk02D7+DoOD5TaBRb4fCLlKmbKu7Hny/1atHbJ6P2VZm
	tcX6Hu4NkCBhXofsteqQRt370ZSw/O6O9WX9g5i8VIm4+NB48FC91BJ5QAYgLX6yiXsYSw2/ZiX
	IdghONyuh/2RW0dqLAt42qeUlt2GmSZHVhXLZfaogLB3BDhGCHPp/rzIZn/3acCRfMZ7xa2RUBj
	CLv6h83HQqijvcqJEQOzZkgWeLwSIvtv2hv2Z85RJfttY9ypbxr0VBVZvA7DeYN3/kMMCR+BlQL
	EV+XpZT1TLeCwknlRW3iSJ4R5kqxulYgeBEvTT9xJ8I2mAxgRN4zJW3857kFfsDko7LnI1X1Zct
	zb
X-Received: by 2002:a05:7022:911:b0:12c:5e48:4c01 with SMTP id a92af1059eb24-1350441939fmr6474502c88.1.1779112457687;
        Mon, 18 May 2026 06:54:17 -0700 (PDT)
X-Received: by 2002:a05:7022:911:b0:12c:5e48:4c01 with SMTP id a92af1059eb24-1350441939fmr6474476c88.1.1779112457051;
        Mon, 18 May 2026 06:54:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm20870488c88.12.2026.05.18.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:54:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Kyle Farnung <kfarnung@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, santiagorr@riseup.net,
        stable@vger.kernel.org
In-Reply-To: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
References: <20260513-kfarnung-ath11k-srng-clear-pointer-state-v1-1-bc700dd8b333@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: clear shared SRNG pointer state on
 restart
Message-Id: <177911245414.2671480.12255059395274590716.b4-ty@oss.qualcomm.com>
Date: Mon, 18 May 2026 06:54:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfX3aPe/2KsK9VN
 7wiqUj7hAiMAzqcdfQHgwIdqhqxdk1Uy+e8DboUZuyLqVrYnCnst07nHc3XbHY/2AvC2OiuBs0R
 QFVYYqIZDFoDkZG2RsTlRX71rEFyuqDK4YRzdoql+84NwOC8iTUeJOYJaHvkX8w2EXiJ8LBV49p
 oxObEl8rtESS11DlTOUGeml2MLtqKKcLpCCwVXo35PzgEkjBGv5/S3Q1G8cQAe26U7FKCLxyifO
 rUdMdxxVM8eDMjVwSHQg/o/HsCsgc9+HcRcUrFjvJz8JYbsopX4Bps275mjgU8BGVoqZpDdwlop
 mNaPxFJGwMSPSe3VxkTF3N8bXQ6PQXwpgsmbTEBgHQ0VBDH68QhlSinzQOookfcCMOLinmyRG1A
 k4a8KpsVymUCzAwtKGLhaXoIuukXIaIoF6hjJ5o6CNk9Tc84nog6CovT9RrF2/0h5BS07PhsTYw
 HbPw0TGnklFvBr2eUzg==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0b1a0a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CbO934nNXDxLm8dFh94A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: A7G1-OF6c3rku4xpVYE2p4PCI0Y10Wf1
X-Proofpoint-GUID: A7G1-OF6c3rku4xpVYE2p4PCI0Y10Wf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065419_734413_88CC399F 
X-CRM114-Status: UNSURE (   9.29  )
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


On Wed, 13 May 2026 21:52:12 -0700, Kyle Farnung wrote:
> LMAC rings reuse the shared rdp/wrp pointer buffers without going
> through the normal SRNG hw-init path that zeros non-LMAC ring
> pointers. After restart, ath11k_hal_srng_clear() can therefore hand
> stale hp/tp state from the previous firmware instance back to the new
> one.
> 
> Clear the shared pointer buffers while keeping the allocations in
> place so restart still avoids reallocating SRNG DMA memory, but starts
> with fresh ring-pointer state.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: clear shared SRNG pointer state on restart
      commit: f51e4b3b5574ad8cb5b16b11f8a1452147ece87a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



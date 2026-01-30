Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF5CE6BF11
	for <ath11k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbshZACaI2TpgweTBaG0IrkB/gEbCmAGAJhjyCn4Ijc=; b=0TjepdhBWLlgP1Auz2oXbQd4pw
	WRpfeQSzo92mKgQFsMGx57R4FdVwA8QypNFNtEoLiL2O009E1TEQjzUar42adKuAuUEbYVltMU+q3
	3tI5OV1VdBEw9Eaq+dDljAuqRb2SBL+VcfAbDT7Edwoh1sAhYLURJhKQ8lMP1xs3Wy5id0vWbha9/
	eU7GnhHG2jhstV283GbidENpPu1lni6JkKSEeqPfRBz6KcknyPCkLznrIGQjFmZH7e1ck871mkNg3
	fVkjCBPcyMPyKZfjqAfhX2BYGAMtQgtGX7ZuSZIexFBy627UbDBWfUNCeRwJnNG9uo0Uc/SoxIhJO
	qSt15mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDo-00000001cu3-1ukC;
	Fri, 30 Jan 2026 15:15:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDl-00000001crj-1ntd
	for ath11k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UDxtWF2412953
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DbshZACaI2TpgweTBaG0IrkB/gEbCmAGAJhjyCn4Ijc=; b=lKcbldHQhpSwq61E
	u+kGUfYX/EjLX0cujxO7mPvaZdKVLAkvSsz2szdGgnemisiREB1NANcTOzR+DbGx
	DW9F38RTwKxjttj08t9DqWyo7Q/R6jVzCyZYqFQGj0VRDaoMQqoVc+JTTdhC5j8V
	xohQoMuB/bzbks1y14YYyq+eon9g7mAbHatg1fazj4vL0RKnB/Ujz9ZR10j0E5Cn
	hNgjlE0Jv28Qx27HYEtKQ2SpShmXK2LHMVAECiqXudtDWt2s416se+McuHvawXXt
	C7rDZT9KF92fUAR8hSu9YcQcuLJcqzElAzaInmSwtBuH2oVOjzTvf0j7HVJcVnUy
	5Cx+Kw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41he2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b715b26fc3so3140164eec.1
        for <ath11k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786139; x=1770390939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbshZACaI2TpgweTBaG0IrkB/gEbCmAGAJhjyCn4Ijc=;
        b=FJAUTpwAWiCTfs6b4v1XY/vCHTFhgl3+RpD9FaSbpHEs8wvjmZD+OpHl5AyOoP65x+
         4ejvy1hpL3H+2N2pS1csr0z09Sbklk2ujquMhKYOWWACr86qwssqLA1VsoKqAzd5motF
         6eRNIKQbo5YCXc+LCnTuTPBNmJFIoqNaafgBnKiSsVVVtLig5H9RBSEfL2o0QaXCZhU8
         KmqVtohXGKmjJM8qiF+ZL28vXPfDRcSWMJHVCiQkudwidmd2rkmtnf99nXgVOmSm5pXH
         cyB/877aalXwAy3ytNQj8pZOY6N+W+GW1KYNsVCMuIuTavXlTV0vSc8xYLd/HNJ/HKN+
         sa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786139; x=1770390939;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DbshZACaI2TpgweTBaG0IrkB/gEbCmAGAJhjyCn4Ijc=;
        b=pZe05YL9erivE3RUdl13MZtGv70+dD9YurG2M+7O4gNlFLt6kwq+XgXY7qmVPRAoXh
         ODdwB2UD8WvcHudTfJgQmbY8rkGmPGwnGxRgM5NJc/L/ugga8shR5Qu9/pC0ntdI0C7P
         8+Dw53Niq9zmg3e4n04OT1KgSCxe6bCGZW0zZEUA0nWPcTGYFLtJ2f9Ah+Esow54EbUb
         hOVrZ37KefZBA7/HqCr/p3/hfU99NGIhkPTEMm3wlebg36kRzli+ar4Tt/XiYEPKEaXt
         lX2cOR9PyBUp5RQ6XQmW6JaxmhJeeQ5ccNnJDzC/fxdlVm1PokFerwl+egSG+wWYxtj9
         9E8w==
X-Gm-Message-State: AOJu0Yzy7mWk7NiCP5kSPi5LQnpJKa6gHkUFyt8LOzHS3uSushTYPIqC
	LPfjXNhJUMrP6SGHhAseG2GjZ12mAwx3QIocsCpL+XFLM92oJ2vOWz6u3GnhPN7HRAbCkrmQI9g
	2Ep2FpId/Vh4b2GzujuC4iBzkdRdMbw1ZxG5HX4P2hKZToYTrC2Bf358NLK1TZR5u
X-Gm-Gg: AZuq6aJ2gQtBAys6xt7hlGjJFhGvryIAiW1n8d1P0vVFdHz7r4mlZ0f3oN78Ezsb1K8
	RflvXU11qQT5pGEwcTmaDNe13fC148LlratlgKMQatu/doLZ1xauGG0qSRsbO2A9HbuNXqxlWRs
	ml6yimyB9MHebU8JgDQ2oeNFqonuAPTsJQYygqFF1tG/63terqJ5i03wcIFmWjMLAG5tPz6IedF
	PSJ7rHsG5wBkFUN31ecejWknhQsmD1WYtq3mS8nvWwiqXDi4qo0WIh9Dp1ZreZFqFywzJA4EZl6
	aWw/jZ+/GS1s1VTQaVWxcetVOxLSnlvkAXD6D1aTKmw7KCmiDPucCTig/3qj4YIbdGl/Qa4FWha
	80VHY5hQFbdE/vfM2SQfCrAyYqZraZgol40p7OKy5lmE7GYCQD0qb+I7W1+HYwG8F
X-Received: by 2002:a05:7022:160b:b0:119:e56b:98a5 with SMTP id a92af1059eb24-125c0f95977mr1556931c88.12.1769786139043;
        Fri, 30 Jan 2026 07:15:39 -0800 (PST)
X-Received: by 2002:a05:7022:160b:b0:119:e56b:98a5 with SMTP id a92af1059eb24-125c0f95977mr1556898c88.12.1769786138469;
        Fri, 30 Jan 2026 07:15:38 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:37 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org
In-Reply-To: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH v4 ath-current 0/2] wifi: ath11k: add usecase firmware
 handling based on device compatible
Message-Id: <176978613758.3951544.9836085450267342032.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: hsiUqfAlmkGGRnhe1-FOkSkLJJM3v4Vy
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697ccb1c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EQHXZ3lbxlMgNUwFsMcA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hsiUqfAlmkGGRnhe1-FOkSkLJJM3v4Vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX6wx5QeLq3zwi
 0WtyFYC9EitzCulMW+UqQWJ1UKq56Y1PI7FYWu5kYGFJo5lzTzgbWPQ4vKyI476Jsc7MlDkx9pZ
 Gkb4ki6+sscVgpM/gWEN9Kj+Y+uYjW3SzsCMJ9oMUbEAAhbrJcZSFUdTNXdLP6EEJkYVjUm4LVT
 gxqeRG46EqCFcvz7RQOC0tMEmEb/R06E1wc5b6hSyCBzpevCupGXACD7mxavfcBByaW9YYLbUK9
 f+ioz2rXzslTBoWtfPSsxMsAKpn8gnVXeWNvimEVIhHzJn6/Lk3lYZgt7uv6Tb2fYIhK8ZLsILU
 nS42xz0AgcEc9qwie6b5wD2Q8/NDCPea/eBSgaduS+Zczd+2VvIwT+A7xVlfJhPCJm03G3OHHff
 UteZHLb11WJgNLXOaBGom2ef79LKAs9Yk073oLiZl4fQkjYaAs/oYcC0hBa546HE9i1EkL8lXpx
 zr6YQx9J2Vscek2OQdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071541_587489_7E3E0F12 
X-CRM114-Status: GOOD (  10.11  )
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


On Wed, 21 Jan 2026 17:50:53 +0800, Miaoqing Pan wrote:
> The 'firmware-name' property was introduced to allow end-users and
> integrators to select use-case-specific firmware for the WCN6855.
> But for M.2 WLAN chips, there is no suitable DTS node to specify
> the 'firmware-name' property. In addition, assigning firmware for
> the M.2 PCIe interface causes chips that do not use use-case-specific
> firmware to fail. Therefore, abandoning the approach of specifying
> firmware in DTS. As an alternative, propose a static lookup table
> mapping device compatible to firmware names.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: add usecase firmware handling based on device compatible
      commit: c386a2b1068910538e87ef1cf2fc938ebf7e218f
[2/2] dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property
      commit: adce4fa499611c1c6eaf19d6fb0305ec0731d06f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



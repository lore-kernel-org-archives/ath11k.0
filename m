Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09059C44502
	for <ath11k@archiver.kernel.org>; Wed, 21 Jan 2026 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PURqCEKMifr6B1GEdQBwSJlrDsBZNunu+PWkWKYvso4=; b=ynVcne+1vsBYMCwM9lqgWxVcAp
	XM6mWHk4k2US5WwnBdWnULQJJ0NPh4w5920//bgb0niY9X2Uug9RPOl/d7Tw++E4N9punICRCSKHR
	EGR5t3+QSj/x4ZUOyC7Cvj96ypVY5Lci9OJsud/qSSSvwvcRqFzmM3+bAIZdTZHq3ZBeHCvxs45m6
	sbk0gIDUm+nHBYqktjaxt4OQbEP9a4METAuBptiDidrVn9iuRs4Hv6NCRHhyICbHT/01d/4AYTENe
	wip/kumPJaDQI/u3gIdsK+7iokV67dGvkQDWXNNxclH4RGEU0uSmgpvRGB1QLkZ/4WLXulFxTiWGs
	4V70jiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUri-00000005DRI-3IkZ;
	Wed, 21 Jan 2026 09:51:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUrg-00000005DQk-1h8C
	for ath11k@lists.infradead.org;
	Wed, 21 Jan 2026 09:51:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6EMAE1530068
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PURqCEKMifr6B1GEdQBwSJlrDsBZNunu+PW
	kWKYvso4=; b=TfYz9nVOCmQAgibu+/xtDg1dYxQXsrIANkLIhx+JpxA9gqJlih9
	En7CCPNu54wGiQK06QIRvaS6HXUmzWjzpR1dEU6xkx9trQiu+FJHyvvRjL3rZX6m
	UQyCA/HoEFufwfeOlpuDS/xbrIykEk24f78BnT7TVJF7rV0CCt57CxkjI7zyKrbd
	1wSQWfI6+n5+GLC+knxiv8TcRaQC7VcnaKiUMC37MEEYzPRlJFcUfJbmroYgwKLg
	r7F45cYSERx5PQyIi49Efz2aTiewWA4ODBBMCNo5njoD1luNTzxAuyaEAd1a6+YU
	Uc+8GCT6gJVZF1buvDFkKEouXHcj1GMEyOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83jqge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a78c094ad6so10106325ad.1
        for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768989063; x=1769593863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PURqCEKMifr6B1GEdQBwSJlrDsBZNunu+PWkWKYvso4=;
        b=CHvQ1mdv97E2Eh+VBvBomGVi8TebCJczsEjzMMOwaDS4V6S615fQdGPbf9/tPVvRTi
         Rqwh+kyZhGHbBcTpStueWwqnsbNdTG2GSD9x+t01/eoMzkh6xWUSB6ZWnwbxb10LEfDX
         G0UsehyOGZycs7/3THzLVdXYdUSn90bGudXa6x7c/x5KQ2FHbxmFDbgAlUFHdH9AkD0Z
         4lFnaugqDGdTS9ZdnBT8a3IsI6VeQGEwh4doJ/H4aQbbC11/Ir62zJTzxAeRDOrh5HR5
         R4g/tGmXGIDWej1+/8jI89nuBVnAx9eI8YQjyj+nHus9/+SHpec8Y1hnoDW/ji+eK6Vv
         VT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989063; x=1769593863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PURqCEKMifr6B1GEdQBwSJlrDsBZNunu+PWkWKYvso4=;
        b=eEsl3s1DOetX4DFpY6Y5QlIisJ8THBcW5zQqEuqfuslBAZp/2V/BF5mc4OAUyKBAr2
         JFAytiddbjJVjGYze2gqnZfFLPseWCmx31zlJf74ZrzW3x1HY0n3lHdf47lqVbsCaYUM
         LVmHaqzPUfkWK+Uqvh44iY9Q6WsIINaV2gwSczvwSHL03SFAdqSLv7sYlWAEC5zDSuNG
         nygM4lpecV6jxg7y62/rx31q7FfaHDLXyks7SUqr/+1lj5Yp2GrESAHjAdN+qA8Oaryz
         Nu3qHoLIAo8F0/CZ3wA7eSiGETlF29O5S9d/WMAj0X7TNzIH/cMYTcZe3Yal8aTE16kH
         grvg==
X-Gm-Message-State: AOJu0YyXMYD2jRLZK876uNOTF8Fz1KP2idUAOw/hf2BatioyQ+g3PlX5
	7fvHK/kYaNAH3ldNnhLmVY1+UobsqDIAsl/siur/tpbJtJVivkLMeJ1izcqrBqn6qS1QP1kzECW
	4x+nkFzoxwKLtlV/+lmWnTApatecvGG7KGPI5hK0LAuywokLz2ungaZ/gGef/IDCU
X-Gm-Gg: AZuq6aL21zT/HGYEAfZfk5mRHOITxw11CuKGlGMSvAvHjDryF0WT+C/+TgeuNBxawro
	9xZDzndL6b/g9uoWzqHj6f9AxsYDBPAqEjG1r1VqMshCxUgDsF1r1rHRBEmoPPYkQiMmApPaWXh
	mtSoq3s9w+Ckur1zNn5/0MWR4bWmOxRZINE0LUcCoRULqKZ/CBtfeRIwkcv6qxfXXZSzJtxKEyv
	6kEAB7mk75wRgUDvlEtfz6y/B4lOSaIWHmKXzxWDr4d2yp1rP2ljqVxlZrkdW4CZounFWnuMwXv
	ihmrenY8el4I+2D7yd+DNQbMObUFw4dDeRqYCGFjU7TUfBQp9ykJwDoPCkwxeEJopPSh2v62Gtm
	BZDegnX9AUexrHA10mPeRHN9rBE5pWkI5ov0UDQ8n2Yex4guF9vKSWlP9G1U6E2Fy3d+J
X-Received: by 2002:a17:902:cccb:b0:2a7:5171:921f with SMTP id d9443c01a7336-2a76b066dfcmr44438185ad.46.1768989062952;
        Wed, 21 Jan 2026 01:51:02 -0800 (PST)
X-Received: by 2002:a17:902:cccb:b0:2a7:5171:921f with SMTP id d9443c01a7336-2a76b066dfcmr44437935ad.46.1768989062449;
        Wed, 21 Jan 2026 01:51:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678af047sm16997295a91.10.2026.01.21.01.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:51:02 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 ath-current 0/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Wed, 21 Jan 2026 17:50:53 +0800
Message-Id: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r44osCi-hXRXprB-dTLrjupXzYC4zpqM
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=6970a187 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AnkVv3gU2zmn-KRWxgsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MiBTYWx0ZWRfX/ciosyKinFgO
 hqmz+UX4oSDf+qy9e9lFgkCwhO1BQ3fAN7t7QAnTmgf8oEWR0iG3Hw1OAyGKXVDc0ImtCZmVqW+
 gVK7IXp1001qerJrjzaGpBVy0MBA/pkeoH6or3vC/gqDieP19Kw/sAjPYlorcixyUm4TBsFVefj
 7g/gtFViobUOtJEAWYXmtiffDIuoTcYTQRE46K7qc1diygsu2z+4aTm9fFh4Kbf8MXhB4brpqQh
 K3ImNDEv64E7Qk37zSdW/j5hpVwowvLqE7nJ4gGklDp/X7kn6ZLcXupWe0wf2C5HJls2Sbj6cMs
 vzIbkxuVo5o1S1QkEp6uJNQR5d2cXRNu1tUAjuvuxQsFkDcMYTxyXbN77UfuvRa+DGjEL3XI3w5
 61cOUzWsKA33s2nsqFwyeTDdAQ616C1Y2r9TsS4Z0pp48+IpeMojJq86Lx640cX2Van7AlEV44N
 LDqbmc2DxTqLWkYLNDg==
X-Proofpoint-ORIG-GUID: r44osCi-hXRXprB-dTLrjupXzYC4zpqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_015104_447860_336C23CB 
X-CRM114-Status: GOOD (  11.25  )
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

The 'firmware-name' property was introduced to allow end-users and
integrators to select use-case-specific firmware for the WCN6855.
But for M.2 WLAN chips, there is no suitable DTS node to specify
the 'firmware-name' property. In addition, assigning firmware for
the M.2 PCIe interface causes chips that do not use use-case-specific
firmware to fail. Therefore, abandoning the approach of specifying
firmware in DTS. As an alternative, propose a static lookup table
mapping device compatible to firmware names.

---
v2:
- Drops `firmware-name` from completely.
- Updates the commit message to clearly state that the property is
  obsolete and the change is ABI-breaking but safe for upstream.
v3:
 - Deprecate 'firmware-name' property instead of obsolete.
 - Keep the ABI backwards compatible.
v4:
 - Use of_machine_is_compatible() to simplify the code.
 - Add back Acked-by tag. 
---

Miaoqing Pan (2):
  wifi: ath11k: add usecase firmware handling based on device compatible
  dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name'
    property

 .../net/wireless/qcom,ath11k-pci.yaml         |  1 +
 drivers/net/wireless/ath/ath11k/core.c        | 27 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h        |  4 +++
 3 files changed, 32 insertions(+)


base-commit: d8e1f4a193101a72235416f189b01131a57e26e9
-- 
2.34.1



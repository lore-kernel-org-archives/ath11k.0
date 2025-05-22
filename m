Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3448C54ED0
	for <ath11k@archiver.kernel.org>; Thu, 22 May 2025 01:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zGBRTqAmBnvpxhEF2Dmcbo1fNVeSsL+RLE2tNu0FwQ=; b=uamthsYWYBLm2onGX0Zr9IT7/+
	zkGshjlKJlZUihShUQWMKP8wHHjXVNntMZP8b9UzhOz571XhXsR7KIPtqb9ehiClFhINEZ6o0eqDH
	jLmckYZyYFCrsPmGqMUG6qVfgC8mLoBuC/Xn/ml0Atq8Kqn8Qf9LBXHCwb507kmbsWm5kpUYM2M7F
	DX7MQPVbGEeV8PmqSbbx9kg0XAlIu/LEpxCmF6WPXdUM7SIMPPGVtGCp1B+7Uvg30V6hrzAYk03aW
	TaX7S3liFOSEPJUmJ31zryY07AfwLNUGBQexEFc4+8PEjr/2OlqdHkAXn5+TPGJ5l2AuhtjwjljMi
	YKr2eNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuq3-0000000HBre-2iMl;
	Thu, 22 May 2025 01:35:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuq2-0000000HBqg-04Ui
	for ath11k@lists.infradead.org;
	Thu, 22 May 2025 01:35:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIC2UN024826
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3zGBRTqAmBn
	vpxhEF2Dmcbo1fNVeSsL+RLE2tNu0FwQ=; b=YmSZrNhaKyrp5isvd/iCkUDyO4v
	b+LNo7foICPxlskIxA1UFovhLjB7ajYOcJ7Tts6YHkhiaOHNNqmfVl/tnM93/Coh
	aeBDS0w6wQjP++GbA4c2zOSxk4tx1WlalQ3Vd4wWw7nXiWC3EoinuKg6UZih0MLu
	TEn/2MTRON4rIg22kvZo/F4YBvYAF0iT0S8itmY05Re23XOLOvhZGk6lk0QBodRY
	n7BR6wLN4OrTgEU/CxUgVntbFWDl1bsL0LcA0vEgRNFGdWqNrGdmUFvcMjA+62HM
	CP9nXe+E9iQFcRNNvRwCMMNuVX+o452YZxKwIpzNd20/WPhAD7/DczHARyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4vmc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231d4e36288so56735045ad.2
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 18:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747877712; x=1748482512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zGBRTqAmBnvpxhEF2Dmcbo1fNVeSsL+RLE2tNu0FwQ=;
        b=uKrquDEN5+v+Juo3F2rm3ApM4c6xhR6xMYBdZNXHTAEop973lIW13mjbUjP1DMMETx
         iYTMohi5iGJVtP4M0CL6ntbNLuwtWXN8Uj7tX49zRAaRJSpy+uwsAvKo0Q5xkyMlGhPe
         nYoaiJ+ciaaW7umQCf1mFTlTOhR2Qc5YS1P/+e7grq/bGUDZsPK+UGYAMv4xrVIISHk4
         ToxPXCex16PYilXlSPIBG1eOk08Q3pGVDI2FMOTa7pQ5VNB6cJYg7JeCeoIjUp3TI0EQ
         u0dEKIFZjbsA70qhSVmDQxPFxHjNjogDaRYm8WJfF/EKY7+jG8R8ZkC3fsWfW5xeHy0s
         vK9Q==
X-Gm-Message-State: AOJu0YyfaqtuQv2Bc3gFlCSk6zb0eLPJYOaVG6L7iaU7gfj8mhyP9Opx
	/obfUX184R5wwC2IwUHNGAMCySsIEsWSNj5gj3bYfTRpw36FejqmddaKQC9MW1JTOS69riR53Cw
	qcAcG0k1iqrRQzDrDJAo4kVdoStUVNJi6zd4VzKdGFFIYOV250GNZ8mK4/eGYmO/LWyeU1kp9oA
	Y=
X-Gm-Gg: ASbGncuvTO0QX3CWkBO0V9/UBI0lZlMoHJguqqkK752BdNq8//GACPKnW8uuzHFyWpJ
	g/w9c022CiE1JdT8fC5YZ413f6x3lNdlPj8r8e9LRmx4vyykPlGvkQt5afSCOR3Y9xplDqcXbfI
	/RyidHY856H4SOgLqHBosLcqirtCqnBddPntXEmbD3S2WS5WN1Y1YBDNleQIg4UwXz7P9FOWCqT
	JeISwlF4ISGDWeXHj/WpMdbtUBBVVSJDxaIiMRMy3Gqwo/uMZCnkzLgsd+6QRWoixkqrMHB8MWk
	9gg5wMX8N5Ddk4aa6mrt8wKVn5941lXi3rIW2Ah7++VkBWIf8pY3eUnUUnlqnRAqbIGL0fQ=
X-Received: by 2002:a17:903:2f10:b0:233:ae8c:9a0a with SMTP id d9443c01a7336-233ae8c9a2emr77802535ad.30.1747877711653;
        Wed, 21 May 2025 18:35:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoxobwttIqNxEUDAXBpCLS6Mo7zWZ1W1Sk/YXCKQXES926y90bJCRSSYZBb9X03RqZdoqx6g==
X-Received: by 2002:a17:903:2f10:b0:233:ae8c:9a0a with SMTP id d9443c01a7336-233ae8c9a2emr77802255ad.30.1747877711212;
        Wed, 21 May 2025 18:35:11 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45b2sm4341488a91.26.2025.05.21.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:35:10 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] dt-bindings: net: wireless: ath11k-pci: describe firmware-name property
Date: Thu, 22 May 2025 09:34:43 +0800
Message-Id: <20250522013444.1301330-2-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
References: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ypukgYkT9dhBx32-9dXK5yP5RJUP6UVJ
X-Proofpoint-ORIG-GUID: ypukgYkT9dhBx32-9dXK5yP5RJUP6UVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAxMyBTYWx0ZWRfX0nnbMzeKI62N
 U7BzTOsKFY221xteMj9E29HEOi9WRkOzDCfem4giIG2fwsxDw1JtJxmPKidP86t1AhfOX3QYJCp
 2IUO3YCbfDQrMPA6ykhsdcUdMzkeQwMKm6tRh4MfTPSNRgWEm8/vAEvweLg796b7Re2elR/7LPC
 kxLWfyP51IcD9XVDdffDMw9jR22fWOXEX117T2qTcxOKj4A4Uq7U4U3B5R5rq3hne88pIndbt/a
 sdRP3mXWjLkeSsLIvV/2Mgn8Sg/tk4R9jxkEGlhn9OQDIbGvR3pjPolyXm6hTf/9dPwsnRi4zIp
 wn+dHNXqbdttUKQEBQP30zPg4qpNvy/eo0OoVSn6rfmtQwcksfzaYw4Y9GIidkkAkqgwb30Xs44
 KlLLYBctzRuGsIAKrb0eD0HVk6DaOFQ4R+zWx5wkyKgKoDrf3lUveQ5SicSb9rVRGB+FUfFS
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682e7f51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Hda1I3ypr0uxOpTqMjQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_183514_193549_45AC9EE9 
X-CRM114-Status: GOOD (  12.19  )
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

Introduce 'firmware-name' property to allow end-users and/or integrators
to decide which usecase-specific firmware to run on the WCN6855. This is
necessary due to resource limitations such as memory capacity and
CPU capability, or performance and power optimization for different
application scenarios.

Two firmwares are supported: 'WCN6855/hw2.0' and 'WCN6855/hw2.0/nfa765'.
The former is the default firmware, suitable for most WiFi 6 STA
functions. The latter adds support for commercial-quality SAP and
optimizes power consumption for IoT applications.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index 653b319fee88..e34d42a30192 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -35,6 +35,12 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
+  firmware-name:
+    maxItems: 1
+    description:
+      If present, a board or platform specific string used to lookup
+      usecase-specific firmware files for the device.
+
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
-- 
2.34.1



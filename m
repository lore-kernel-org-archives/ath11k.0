Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0BFD5B16F
	for <ath11k@archiver.kernel.org>; Sun, 14 Dec 2025 02:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjDo1i08pHcymyjU0SZNGgKOp3in8sB3lPLBnMOiSJI=; b=u5LvtSmhAj1l6H9nFOeMk4N49Q
	jqgJytZT9ITFT7wXfbGz9KttoCKkpPVjeO+NYjFyO4PcrHZ21zRoGiXdAnE0mrgoyDcjbp3E5lMsc
	tuRiyGr6aB3MYaFALZLG1F1FKtkv46XfZ6FTAlQexm+hCStTQc0B10w0s0Sqqs0eK+6s1PKXDzBDi
	QWIowrssahhsU5mIndu+T+ml1EdJhVEKL2zlSOZW8lfkw/hvi8UJGIyPy09p3Y9nSsPzrGe/RcEkp
	lcCCi+N+pOlPLzpjCuOqYSJAGgUf+cZbzmcga2kFy/RicSuBnOUXwsnmMpk9Iff/NA/rAySYQeMx5
	ixi9msUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEl-000000027UI-18KX;
	Sun, 14 Dec 2025 02:53:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUcEi-000000027Se-0VzV
	for ath11k@lists.infradead.org;
	Sun, 14 Dec 2025 02:53:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BE0m9uj961579
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YjDo1i08pHc
	ymyjU0SZNGgKOp3in8sB3lPLBnMOiSJI=; b=LIXvOmdPXyEMeoeQ1uFJm63Tpac
	Yldh4RAW1V3Jy6wRW0uBT5OzdNJGdqUhJO06f7dYUfgmxvpuXBS6nvv7VxOyTisd
	pmWDMQ9Pr+Zd9dAulsaQ/sJngSPmhwHXyA8r36RjXBSB5MAFJ+cxWUlo7Zl/c2pE
	3IBK8NVWV4zaFZYYs2gfv17QyC4NnNH+XcBC5YrQyBJke6dvplSEn6jyws0z1oIm
	Y8uUXeyfDymetRHXu/BKTa+jT1b1iLMpRw+017TOIO43qsou4/ynLGSY+jghxJK6
	HlG46hy5OEn1yzMH2JOlMoIWm9CnBXPC/Vk0dRxdL39y6az0pHmPC/jwQ7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11avhbe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 14 Dec 2025 02:53:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso3727585ad.3
        for <ath11k@lists.infradead.org>; Sat, 13 Dec 2025 18:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765680806; x=1766285606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjDo1i08pHcymyjU0SZNGgKOp3in8sB3lPLBnMOiSJI=;
        b=gCDZ7Ls/MpyrU+p32bDK7/jwUYGiujMG6schcEPKBSP/qSN31jViHeCiMHE0ovtZg6
         KFzH2RXaNiKk0Sl+RI8MhWbJRkZQUypGW6LZIdpUYL6ZBQVJ31E/QZDNxOqRwO9uqmza
         kuO2JSQyVJLtd22UzEVHxmVxM9xxaHmc0Q8/qhh0BE3KfHtS4ItkZNfetTOJsL9qVFRN
         rfgS10rMHxp1C1lGp69/zhHL81hMkrmQjIbZh0GoUfdpVt/SHNATAw3f8Aa9nf3y2SwF
         N7v5nraN8855RiznStsgKVjfkCgG42faQ7Ov+PobM0Jxs9Vsengt2Z6d63pYYe9+J9ea
         YIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765680806; x=1766285606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YjDo1i08pHcymyjU0SZNGgKOp3in8sB3lPLBnMOiSJI=;
        b=GhoHD4iVxne7OgwWw7qfoEaekBbLKbs3UVrIixq0hAzTTJGVvoxvDH3T1eBdBZUiqB
         jaGKnXJGjQgj/2Or//BNJ2XML3oPORZU/9Y+ns6Qch9CvCfn1gJKCTH85FL4dgp+vIvX
         l6GwMCxwQqDOGpgElPXp4YDqTFw04ESr7aLvVmM5wYgYOkGvoE3W+SEd1G+fqWltEUvu
         CoN5SbD6SOsKDNPV9Gq1o7qXC10gM5l2BROd4y99PxSTKBfwdigklxicKV3OOZMjmGDc
         k2zxKOuTxvlNspl3N5xKdxo09WW/eB/mx1tTCqHCa/EeQypmtM551JUqlXMHoF6rkXTe
         zgJg==
X-Gm-Message-State: AOJu0YwbSLyYQOTAmRhgSrQZj+/eSzek0v2wa+AhuGjDK8nDIFIavLzV
	cIq2gErDK/6OsWtRFJ+UJ1Biejk6ht5cIR0HXRx++2EwV7rWnOZcmKoVCYvTQqU6hgEuVDVuXBe
	6F2nWcwxMGRzZZuK1eVVIiMnbI9h8r+RzS0QPjMWuiWz/AVo2SQENpYxAjmCeOIP3
X-Gm-Gg: AY/fxX5qnalPShiuGp2bAh7RIIUcIqqKPmJs9jcMYsvzFkjF6Rf/vBYSJJJWOeuPCpX
	iKVI3lG1gECURqjRElX1EyTOCpqgZZP4LFrPKEwwOO16C85RS3OZX7XCo76igrolDrCzhKgpSxk
	9Db0OxhqhveMX0RNJVdSs3apUzZs54C8x7f/5Zu+ZJdRuuQFKThn5JPabUtX2EQY2DXIzax9dtK
	+hQGaiAoGZrPUCDRvgQa9t0KEg1UXqvoJ7s2HbU0aH/6U/OD546g7rvmiK0s8qh6CWPtXGYsFH/
	XcMOk2G0+4cXboVw19j6ygmjmxq/HCr7iztbYFqKayZZqehQCcHoiPl16+4xUx+lDeTDrScUWQr
	2Tz7x4GqnVEUV+PFemzQx0jAM/vplsiuMY9PfCYDNIjndhTFdfcM5wZyUB7E7k9TVGjSN
X-Received: by 2002:a17:903:19e4:b0:2a0:c954:3bc6 with SMTP id d9443c01a7336-2a0c9544164mr7334475ad.22.1765680806012;
        Sat, 13 Dec 2025 18:53:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTp8gIz+/C/5M0QlRFTIVjxKox0Y4t7fw29V/vXLhZOKqSN/LHqhxKLXHhbZ33AtzzjgcNrA==
X-Received: by 2002:a17:903:19e4:b0:2a0:c954:3bc6 with SMTP id d9443c01a7336-2a0c9544164mr7334365ad.22.1765680805618;
        Sat, 13 Dec 2025 18:53:25 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea01723bsm94148115ad.62.2025.12.13.18.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 18:53:25 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v2 ath-current 2/2] dt-bindings: net: wireless: ath11k-pci: remove obsolete firmware-name property
Date: Sun, 14 Dec 2025 10:52:30 +0800
Message-Id: <20251214025230.716387-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
References: <20251214025230.716387-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDAyNSBTYWx0ZWRfXzg6RmX94fOTd
 FjCedcfMi2eBnYQT8NYP4QYIekD1Zl1+R7S3QZzEfrirzzx6bD+6QhCY0kGQPtQ/EMoKS51ZHzJ
 qk/fQiQz/7S6EBkefZ6uwuEYFKYHoI02ujBtbsVMW3d/qfo29jLXCXOgghUJ73oTNbvNWHGbxjz
 M9zoQ2E2CiuSZ6FIta06Ut8V26w72oUuoP8l9qUhNpfebRJ/XYRb2YAE8kSIuT9F3OI4DbXcy1Q
 S+D0JOYL10aDEkaEOCVxE0f5XNkAlpN4r2iocz8//q/SGUBCibmw4HqOBH3xoULP2BqxRQOS4Um
 HY0Njsb9OJQvQoTD9wQkanj4c7jFtsFi4ha/wD/Ot9j8sXnnsxxP3knLqwop045DsOlp5scZH/L
 G5ZVbOwHaTmq7pxEmDFHFKm6udhkLA==
X-Proofpoint-GUID: bYoga_C__jdbmvon5L4s_Ukun9TzTHcP
X-Authority-Analysis: v=2.4 cv=PJQCOPqC c=1 sm=1 tr=0 ts=693e26a6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-5GDireV7CNCQn9VzVAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bYoga_C__jdbmvon5L4s_Ukun9TzTHcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_185328_296506_1CA9ECA6 
X-CRM114-Status: GOOD (  12.20  )
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

The firmware-name property was introduced to allow end-users and
integrators to select usecase specific firmware for the WCN6855.
However, specifying firmware for an M.2 WLAN module in the Device
Tree is not appropriate. Instead, this functionality will be handled
within the ath11k driver.

The driver has removed all support for firmware-name, and no upstream
Device Tree files reference this property. Therefore, this patch
removes the property from the binding and marks it as obsolete.

This is a DT ABI-breaking change, but safe since there are no in-tree
users.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml   | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index e34d42a30192..653b319fee88 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -35,12 +35,6 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
-  firmware-name:
-    maxItems: 1
-    description:
-      If present, a board or platform specific string used to lookup
-      usecase-specific firmware files for the device.
-
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle
 
-- 
2.34.1



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6FCD29C2D
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fGhqupyolB5uH9UFQOHKkgJ43muW2xQ3TpC9A+8sGfY=; b=vpzGAq4s05j9B2VwCYuTHM/HGs
	XJSR1rKZOgfmwUGA6NyDjX/M4l2Bjz6DWhBxRdXhJv3SHKTGPsv3ioRROUCUzha11M1cRkiKJ3/Ny
	enBXdWFXhFoNlSX1XsAMvESDZTpImovPkjgUx01Vuy3jY6Q4pwUj30jUwxqY0pYTjmtNT33LEbDUI
	MbK8PSDDmcnhQ5Mpr8La0uuKHdJ/2hgbUaBvxCjV9tn2+EfJ0tcKjueMnbMjuc/TiR/V41rJ95do2
	IA9P89HVljiEpO4UuMVKesHP779qYm2w9mrHcOzm5etvCBe39Vs7RECraZA5FkfRFW9tyEtO6it0y
	tvB3dp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpqG-00000002DAx-0sc1;
	Mon, 19 Jan 2026 14:02:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpqD-00000002DAV-2vuw
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 14:02:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAR5Zw1661027
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fGhqupyolB5uH9UFQOHKkgJ43muW2xQ3TpC
	9A+8sGfY=; b=k+B8GWtfXi/Dw0gvpD0r0AyT1KUcu7tZb3u9W/XBqYt0Dg4PKjR
	oMSIMAcAq9zfEfHdkcgAiFWlDYhbwjAA0G91+96QXnMfLE+Nbj0Y9TkctgqEgy/c
	zOoRGAYTSE5JZixc/yUAYSmT6tfEGcKp/QbMgfqJuTFtSL9KPAWtrqJZpwJ3jxZZ
	X65OW8lY6R3jkTmsBjMBMc9BaPMUjXlksTKuzBNhGJ8Nnnl+Q9ok0KbGBKu8vTvo
	q2CmuMiISmKcxRltJJKNHcU5HiZm+n3UGpCGXz1+6VXLsyAyXz007SHk1r9bnKkS
	yxIehqgb/jSxEG1V868VuNVg2y/5tpX3Apw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdrjxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f8e6a5de4so40685265ad.2
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831368; x=1769436168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fGhqupyolB5uH9UFQOHKkgJ43muW2xQ3TpC9A+8sGfY=;
        b=GKjcHbeuUXCJdkuwtRpECSfAKNMTHvn3K8kM5hXotkjf0xiNhtBqpu2Q7u3TSdfUax
         AgRZBRJZoRF9hgWiGFTOcOGq6TrRMaVxKgDAVS0s1MtnT3fkR8XD7zwsiVsKiVhJ12dt
         GAUQaWvAVdnOjqh/0zAUoi4iF8XKRcB4PNroDaIIDSXt7vG3w8qVuPVpVQI0hhzLlAxL
         3bkzd6Z6LLSq6O3VveNGKN5HqUAOrUUE9SNbKxhTgFp2446soGgl9ka8EUs24MFrZpgz
         y4xQBAuRi8l/YpwQ8DbeV8XTqOBa7noiL87tp9nx4p2j9vbDRuhOU+LrA8gKOv9tnTiW
         Q4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831368; x=1769436168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGhqupyolB5uH9UFQOHKkgJ43muW2xQ3TpC9A+8sGfY=;
        b=pR5l49Qem+ilzXH3kiy//hz+Izy59sgSRJVAuN/QDm1eMqAu4XfeEx99xb2uDjo6m6
         HKB71HPXsGKaQunnQcfD7+60x6GAmQWaXqWHYy15S3d9U1QUh/Emwmd+cuPu4LVOzNx/
         TBVb3poJhT+tR/ZQvkWJjLX9XZRtetE7/uFtrrtGYplqqCVwaCpipBsZZbHl767t16oM
         dZ5T5mxlap/ZA9MlyQdeaLFpq/py8Yx76u+3j61gyUKSQy+Ypi1oBjgQynipMcVz1Qvi
         Fo2Jat3A6nEMeTjIfk3DhdD9uGYAQM8V0L8DgB45+RHcNCcP87W4TbGCEXBYOGWmQaFl
         2HGA==
X-Gm-Message-State: AOJu0YyxiWzgt7gKmAYsWhELci9OLRkxJJ0v2ch1t/o0+iv/S1O1CBjp
	OCSjL6Xg1CDMcq+iHOj0oBPMmsAiwoxCuhmavtSuUBWvrdIkyD3+uCp4EHNYV15UTryCvT133u+
	bLUhQ5FKY5VcQzhALql4LF0bUkea4mfGJoAopHfQ0i4y9v3LrVvvxftjRKsv+NIga
X-Gm-Gg: AZuq6aLaxJFipANh+mF0ifZtgBwFjn33NeVuu+YPS4ESJAFuBM0dP0WNvimEbsyV+68
	4Qsr/n1SnhhUHVERWghvI1TX8OBlYVI/LpUuTH1oEMl2KV4PLSZ922gr3zSBt/i72cZUcqZx49g
	w8qh75425RS832KNe9X7B/512NBU5yhmQFQLEjrg96RQrQLM/Hovz2S4TfhO2ln41fXlXcYnKfO
	AMRs/5RcF1OZfQbrx32tRbh6oqUCpNPL/iWhM0OOH+FI0UnNNy1YRKBnJBOD8PB0D4pbh821HhC
	VY7lFxxBRu3Ae19fV+X1ODowuL6MCw1YBRRTLvHdje1Q+5Km8nrSHA0IhTYKOb04IAaQhTMUzh2
	lniwdhgheeqdi1HoI7vfEsjDmlZDJZ+Q/efJibRviVr6GgC6XWIA161SD9mlS6P804cwP
X-Received: by 2002:a17:903:3d0f:b0:298:33c9:eda1 with SMTP id d9443c01a7336-2a7177cea20mr112457355ad.43.1768831367431;
        Mon, 19 Jan 2026 06:02:47 -0800 (PST)
X-Received: by 2002:a17:903:3d0f:b0:298:33c9:eda1 with SMTP id d9443c01a7336-2a7177cea20mr112456915ad.43.1768831366809;
        Mon, 19 Jan 2026 06:02:46 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm97416715ad.90.2026.01.19.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:02:46 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 ath-current 0/2] wifi: ath11k: add usecase firmware handling based on device compatible
Date: Mon, 19 Jan 2026 22:02:36 +0800
Message-Id: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfuTxbbanhfDU3ewQHdJ7oUcdF94fdAA
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e3988 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AnkVv3gU2zmn-KRWxgsA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: nfuTxbbanhfDU3ewQHdJ7oUcdF94fdAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNyBTYWx0ZWRfXwK4r7eOpHayr
 W+ykwOE4M7yb16aOq+qT1qVs2bvEt3tNXBFvm48f5/v8F/gd2ljZJnx+JD438idxqDUr8C7Ux5O
 JWtx0/rJ7qB+BacKjGBdzCI36F9yqNMiDH3CVrKSoDVZS9tdeQiO6mEAF6EWXrFIQAs72P1U4mM
 R6d+LTODmmwSMZkQM+YAH9uKo19DAeRW4nOI5RuDgKCtnJABhZEQW7+ThZLtIhFryfov0AVjNNk
 9I979s0zA7a3MUsT1ji3UleftoIiwXsN/LpxDKn5xfXFDXS7Pi7euYKUhUkvphmAi9PjVBZHLm5
 09iSPwORCEeKy7NyM5XeP+kSpagpvtOzTScoV7IbDbxCJld7jAABvXhGTzLmaqqYRXOdpBucSXf
 Wj+y8pt8ClaILFduPArk8lD7NWv48vIEHvXlyA2QNKDmxOYA1kvEVP6AUbX6RGGLwJ671g6R8X+
 o+n6lygkCRQ4LZacuMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060249_854701_CEA9DC79 
X-CRM114-Status: GOOD (  10.68  )
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
---

Miaoqing Pan (2):
  wifi: ath11k: add usecase firmware handling based on device compatible
  dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name'
    property

 .../net/wireless/qcom,ath11k-pci.yaml         |  1 +
 drivers/net/wireless/ath/ath11k/core.c        | 36 +++++++++++++++++++
 drivers/net/wireless/ath/ath11k/core.h        |  4 +++
 3 files changed, 41 insertions(+)


base-commit: d8e1f4a193101a72235416f189b01131a57e26e9
-- 
2.34.1



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAFCE95A79
	for <ath11k@archiver.kernel.org>; Tue, 30 Dec 2025 11:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6gblwXdx1w6zeAfSq0Ah8UQfgC2QXdkAi6Yw+qrgTSs=; b=Y8u+k9yDhnXs4E7xCEllfOEtoz
	tq/fK9rLGNcOWc6rec3wh67uSgOPsthWmv6GF8SPIeVJaPE3aT1nweAh86rMGGle403WaGterzWOR
	/Z12gke0XQEa8wuXaXeCFMW4j1ikUd1Wg/Fr+N08PBoHt1IxXVkvrB2QfO8G4pNrBDbYGJTtRPDIH
	SzRP3sG7i1Jmc73PBE3SUV11/mHg33CNVxxcKDBBahbBYoYH0Efl47wEtnVCznmkF5hsvRqNiProB
	xTkRak1g6M0PKUVjfBDb4ITZznCQIaBOfAHH+iN/Yi22AixRve5QBTPNBrWiXz0JEwkxu+4Vh2tT/
	gaMyGO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYDY-00000004m0X-3a7w;
	Tue, 30 Dec 2025 11:48:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaYDW-00000004m0B-282x
	for ath11k@lists.infradead.org;
	Tue, 30 Dec 2025 11:48:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8k28S2284786
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 11:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6gblwXdx1w6zeAfSq0Ah8UQfgC2QXdkAi6Y
	w+qrgTSs=; b=b4EV8odobWNQ3gyKq8GaYk9NBDr5mhm5tc+ZN3zjcdfLWukMy98
	2hUobZVtGI9z8Il+MZ9xOP+ncZ1VT6NoaJOjLA77L7rAUdf8NqKHdEcho8+ZGo18
	9uLH1Jn60kVzEwfdvn0Urb/vUXFZuzSnruvuz+rbJGxktWZXj9aX8WNV4rTZebl3
	wBzeQh36XgMGD6PyP9VRDh0R3puZBYFe1ZX2uDpFjSEcBxsRxxDcPeM/H5h6bxm5
	mOzS+KcmHncXZ/2oCnJd7B8oJZ3CMAte2TBuIX2g1kp68NuPoajQp5c8vkOiujgG
	TEUunEpURRL7HVxuN5nAItjpdtECl+fAIQg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gstwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 11:48:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8824d5b11easo196653176d6.3
        for <ath11k@lists.infradead.org>; Tue, 30 Dec 2025 03:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767095324; x=1767700124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gblwXdx1w6zeAfSq0Ah8UQfgC2QXdkAi6Yw+qrgTSs=;
        b=Xat8inaFkc82WVxxSGPO8lRgmF0XH5/55zItalX47Gsx4NQKwOJmuoz04z2BXbGPnu
         Qt902EntwFxtvyEAF73F4V9fpcfPI8bBCXYReJdwYqYGO3+uNpW1DMM5Pr7seMqtyWEA
         ad2i9ChHdwJerQYV7M30Oy3kK2JstzewAMAoSgm8KBfNDEaU6i0ljsSgFeWMwkIIRJGM
         LlUMClNiGC6l83YmMyyTPnedNIPZdzq7w+pIfehTRQKS7XzIABTYXhZZRZikHud4U/YK
         Ijz95idiZsrJ+qNOWKqU07TeEcA+0BPGx6EAEvlIX79v4oHXydqWt71C8UaXMYEmEqkD
         +DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767095324; x=1767700124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gblwXdx1w6zeAfSq0Ah8UQfgC2QXdkAi6Yw+qrgTSs=;
        b=TAdj36C3KePX+19G0edI1tLlOWar2YUR13xQZCnnN12f3DoYKWWZ2mLQcdKQro15Jx
         zilBIcaZatKMizFhkM8sEK02EYF/JxbE4mP+oCUESy7wdquwNLB/LJWPr2Oa0QCZgDuo
         2KLwER4KyfjEMCcT2qWBGvvXFv3F7CFl4w76YyP6ui4zi1+MSOGqrVgcJwQ2y08fWQit
         g4MRzFhbya1m1aAWZMgP5OWI52cd8KDSNfJ8b2M3bANUbUL4VAlmc7QvK25Yg5hY49WD
         0MdtK0YPYdOBlBK1q8qQDynsCzt7+2sMpjEzry2RQghAbfUy373hTIHo14Zpc58qP+F6
         8plQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7IssZ4WHpgbg1ADnJLvBVv+BpuR4OxHvzLzhMKyDygbnMMemqIQwddiPFEnwYQj9XEaP5W2A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2YK148cNftqX4AXelQZD9qzoShWbTqnkDoZXvvVZ+Kj0tDszZ
	rm94hAiE/1xF6EnqRcTKtnoSHtYP78eZyAya6ykwYQaWF0foh9xCdRxxKvVo9z6xbYHW7XDCYxy
	ttzC7wPgpDS9O4Z2OoBUylhQoY5d48tik+MkK9JHW7vuLKWfllpWz+aX/wBxaWk+M
X-Gm-Gg: AY/fxX64Nk95Jl0t/gRLGyR4hftZ94AM853f1K4r8oBQGULvOelYfdu59uG/Gp9vFxu
	NnnROD/I98zpYO6ikOzme06bHn1uLwmLdLwvZ/23/LfgoItbuMJVdMbUGrJpFLyj68DVC3RWBaJ
	YfijtSBqgo6GfJVNJpBGHWCLJh9f0ZMVhBaCG0MofYnPtwj4WphXwY6pcfSP8jwN+SApnB+zi40
	EIiQ/6Z2RBvU4Ro8ksOYP3/b3QyhiheSe+xVr6c3zEYNEGl74WYT+KtOFxAwHPbJcH9cJ9503EP
	Q5fNLu3xH29jBZkbV+5wQWqXp17/sTzRxyVTTD0klmTitpRRPYN1T7Umcbk1HJrq1553dnRcuUX
	XZtV/0SCswur5SMcyB4LNEZcPaw==
X-Received: by 2002:ac8:5d14:0:b0:4ed:e40c:872d with SMTP id d75a77b69052e-4f4abd93b38mr420088151cf.59.1767095323915;
        Tue, 30 Dec 2025 03:48:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT2CyFCv0kChh+/rJ7qFH1ir6g/EgKmb5547xvY2AGQtQgM6N/P6krs/2LT5m1Gxwmi5VU4g==
X-Received: by 2002:ac8:5d14:0:b0:4ed:e40c:872d with SMTP id d75a77b69052e-4f4abd93b38mr420088001cf.59.1767095323509;
        Tue, 30 Dec 2025 03:48:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm34802877f8f.25.2025.12.30.03.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:48:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: net: wireless: ath11k: Combine two if:then: clauses
Date: Tue, 30 Dec 2025 12:48:36 +0100
Message-ID: <20251230114835.52504-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lAyvgKKpxUpCZonkIlZPIQ67jJXIdL9qvmQBennlyWA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpU7wUljIvkOtmX+Z+bkysoiEVpeQbXRIwAvk2Y
 skPD9L6LM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVO8FAAKCRDBN2bmhouD
 13heEACBodmZ41wf1yFk7HyKQ/dqO+OqYHQb4hCGMPfwrvEGpumQa4LNARPBc3Rfl5ST/aXDazD
 XGYt8Yuqx72rApNn0vyIe6mo5ef0kaNGY9WbtqcwJdrYdFzwI5eauiGzeecvp2BiNSX3OtrjiZD
 xoefzt0D3irAEYutb2Yvz6kD0bbdbgj+TKH98kjwP4pBlByXn+S6iCtmtU898RVHSIk6hEEw7S7
 UJj1X+a96nUIwCprSM33lfpuC4Gt4IFBeXRMHyG6JNV0+ojjVVnlCybmzOIY7QR9IKXyDJMJtSr
 Rl9k6W5bCIFmzTuVL595TB43lI/FRGGlb5mgqb/nK74sBIpzm2RQRmgxmzgojS/djO7NoV1U2p8
 IGRe5mrVisqJO52SNRsjB02C2VnJ9+VpQ6nZBrBHiskOyZp18OhC18sCUsjIKfpE6d4IdMPxqcz
 kTdE9EYfJkI/IitJ0uanDBLapC+J0JEADt3NyYpgbbqIQewZS8WMsp8lDtCsRwuIN2jUKT3kbft
 Q0Ld0Ipw/BYns8/3rZZvJaDfaoq1XCZWPnSkSCCk6HKBabldhIQGjeWbf5r+PimzZL/foCgBaX3
 fZMwV3LYu0Z4KLX+anXtLIrHat5WE7pmJcuWKwiTW496IKDi394+oLM9U/DPdiCcBEWoApN8bz3 6ziFiMHMlj+e7mg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ygqGqOFEnRwk9frMDEWc0sWQapgX9Gqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEwNiBTYWx0ZWRfX/bvbfecnkbCg
 aHLRxjuBzpndLES5+c504dnWSDP3sBps1/6mwXnnX/16cgGzN0qKNJJUNan1TICNtuF8oUQ6yjo
 +YtvRaCkZ5VC5c+stfxTEOP9IhVWFqpYsVd2XR+zEQ1yvZa0gtzsaYYFz498WtaLxRWWX2cxN0z
 7trCE0NyrTYQZPxwWpqSpbcBhHjG9b9N/tQ6mQI6EUIkdNbbmPUVp0nDG7z1mjYrfY+wWDLWg3z
 ILtHM8oNV3kZYJfsrSqIb63Q227jZIwLCWRb6urzVbVYDPxsMhyVtY1GfHS4ZCWtxxcMxdNt/oJ
 pHErUEyXIgLipPvbdc5ReAP00WPonqhDqoomk7YTsY0cAmBzIEW4o479NsJy8s+sXlgaQy7N2ee
 P0WKJI0fr/TfiHj9jgXYgMhxUy1UyMMW9o+R6U5UBYlL1eAJK+y2gCDG0HgRawqC0R18KgVcgJ8
 uSPrfzBU9ea5jN8HRDw==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6953bc1d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pcR5wRsarG8z_4OSWGYA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ygqGqOFEnRwk9frMDEWc0sWQapgX9Gqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_034846_568191_80575730 
X-CRM114-Status: UNSURE (   8.92  )
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

Simplify the binding by combining two if:then: clauses which have
exactly the same conditional part.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k.yaml    | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index c089677702cf..0cc1dbf2beef 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -214,15 +214,6 @@ allOf:
             - const: wbm2host-tx-completions-ring2
             - const: wbm2host-tx-completions-ring1
             - const: tcl2host-status-ring
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq8074-wifi
-              - qcom,ipq6018-wifi
-    then:
       required:
         - interrupt-names
 
-- 
2.51.0



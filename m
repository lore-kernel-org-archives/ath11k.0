Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7815ED29C2D
	for <ath11k@archiver.kernel.org>; Mon, 19 Jan 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5/a5GAcpRGBaODL6+7ZjI/35JuzQp2n7BUtvP6Jbr0=; b=jday6d3K77xv3tT0NiNFz64VBl
	91Thu303R8cunZXLLm89xYqSKmwlkjjaMXiDDg64j+Qt4g2H5F6j9h+oTJLag1Cq0AwhnNd4GdMev
	gLyx2L3mmAqemaCGXNN99BJ7kxHMVgWpPkuY7Gmvi4hIoyplBiXlMsaFnfkwKdFLhzRU9dqH99Vct
	Pvgb3eBI+OpAlYsbz52gi7h364mAh4XYXdU82AJlS+kY3GlI8PoAhah6A8gB/7nXHq7oj/eqW0edE
	bIiesK3Jny9NGRI1jHhqr2Qk57fyVu6lKIt7kRFhiGGTAYpucfesWezBxQLqVgpPr8vjXV0baEP5n
	OkxQDiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpql-00000002DI6-01h4;
	Mon, 19 Jan 2026 14:03:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpqL-00000002DCc-1z2j
	for ath11k@lists.infradead.org;
	Mon, 19 Jan 2026 14:03:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90kKW228017
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J5/a5GAcpRG
	BaODL6+7ZjI/35JuzQp2n7BUtvP6Jbr0=; b=bIoSRJvIVVKzpf7NzjpQo2kA4Sr
	8zhPaRHIddZ4dTAG/FOa5bdM4kQeURkDii9gKqkX7cfyCDWmKgE+WFjRwPF0LpeW
	6aAk2SRegb0NMZb+so7GYaSch3sGaoEdGt7Tbjfr2STLSqi5S7WfZxPk+NR/E02+
	ONp2xKXdXKCJxT0JEES8KP2W7OtvtVHv29I/c8FrZxDWdoe8m6o2nW8zDpandhxs
	pAo+k1Xbf0KS5q4GdtxhUkX/67+skuJFJnvPxnKPbC4DtMEQ6To7cz1KUmKJfcbp
	ko26tsoLzPBlh1MNIWMDPSf8BibV3gk8hVVsOmAVRGd2sUm2LMFGAniKgGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr95js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 14:02:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c21341f56so8288957a91.2
        for <ath11k@lists.infradead.org>; Mon, 19 Jan 2026 06:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831375; x=1769436175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5/a5GAcpRGBaODL6+7ZjI/35JuzQp2n7BUtvP6Jbr0=;
        b=VVug/7g3V+tkMDiqCOWxqS/YkTQCUTd+ss+1crGyPF2K4KSy3ZLpduBKExgXI8UbyN
         XggkMHzbT0YzI1B2Th2MDP2fAAbnwpJlyO/tzMcBG6Ydxh0laemMouOxUIYRvPnZfRFR
         dclJREiBFgfapq+wMJp5RbBSdi1oNn362kUd9cCXc5uo6dy7/CG/scwV2wJ6ghj8lrIq
         aATIps01GL5MUYnam80CD4TbxpcgM0x0r8N2FHhDhPZmiki5MNw3D5PbB/XYg586v1A0
         /ndec3ae8T0PQOCO/UgjbJi4JnUJ+d9pndd/6JRJjjGve0O/UAH5hY6DsJm+TOPtl2aN
         fhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831375; x=1769436175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5/a5GAcpRGBaODL6+7ZjI/35JuzQp2n7BUtvP6Jbr0=;
        b=P6aiYgQsT6SqODttsp+fvNbp7+hCyV8cnC4pMyrz2gt37bHGuBPTi8VU8IjZyIN8MA
         4lszQbEPmj8OQZRHac787xWb8YC0TIkHccKQ78Cf5wzBBQidnCo6I9A69F9DyFkcLsEK
         hsHRNgdl4vHob3o4I9eu7fKc2jQAb/U87PTzTdY83CBr74Z/UuEdyTr03YDMDa/NPaXE
         8LM8hRyYb6ctF5rG8qnPMrMCdf7jTdkIKbbT9tE0jAc5kc6mQARBPR1+jyRkb+rypHnk
         I7j4ny74mWNqQvpU4j8p9eG0OLyNB8aSew6NteNdNi1LMkrDmazZZRcPwVn6/U/8ZQp9
         Yr/Q==
X-Gm-Message-State: AOJu0YyMBB3KXcYivfScOR4GaOjkqx7doq73CIlxhbsBrRgSVprxaG37
	QXEAZ99ps5ns2po6faWtynyES1hIbjKC0X7G35TfF024jzgSRxy16D/2X2svMjLm4PCRpuJCWds
	67lT4e85jSOtLVSsXF49aAD+sppmQLt9EHSeSNpT4TAvN+knALN66D+olBVAwnhs2
X-Gm-Gg: AZuq6aKVvmXAPOU0Nz3F/np37pdVsw+2CDdcCCTRpBfiVuZIVmG2ydpYqBoLrzaVi+l
	lOHkE1i2/KdCMAosLLzDiOmE1UAi6mAarX7XqodDDVPUs0vR9SthN5HndBmg2r0DTe/ltAUfD0V
	AgQScLdAaza8G0S9xi3tueNxS/zSukKr605Gwfm1lcq/eEgEF/sIuAaZo5gTyeArWioPJ/A4aBV
	C5LEUR3CENJagtzT4UIz22YfwrF+mj0pfUnM1gADiH6HuO/YE1v740yifIoT94xRdYsFofMYn41
	AsM60GnR9eBZWGUdKxMy8djFufOt6iKyBUP0Cu50MWr1Vg2APeM2xy0+RH586I0wXgnc4F+IX9i
	JGzKOY2s+xnWN383epTdtqNXsYsXsLwXQKfZ+hLmiWQ5x4HfzFb/hc0+Q48TswdK3HUS1
X-Received: by 2002:a17:903:138a:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a7177e0b55mr111488435ad.54.1768831374648;
        Mon, 19 Jan 2026 06:02:54 -0800 (PST)
X-Received: by 2002:a17:903:138a:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a7177e0b55mr111487955ad.54.1768831373959;
        Mon, 19 Jan 2026 06:02:53 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm97416715ad.90.2026.01.19.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:02:53 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krzk@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 ath-current 2/2] dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property
Date: Mon, 19 Jan 2026 22:02:38 +0800
Message-Id: <20260119140238.3360658-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
References: <20260119140238.3360658-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rn3ZUOJmkDKIk6Udw7xk8dpZ6J_VwafI
X-Proofpoint-GUID: rn3ZUOJmkDKIk6Udw7xk8dpZ6J_VwafI
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e3990 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gumsBO624h-QSWVlTkIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNyBTYWx0ZWRfX1OOpD0YTAN5L
 wOhQFiAdtkHDHtQdsJ8PTlgFWatHgdlVpFDCrHclmuTCl3wrcu7UpXuYgrMmPDEWI/naHi6h9G4
 w0htFAHR38FecWMxEd/xmzG7m/HBpXv+80Jj7xyllhryJSaDnzYeVdgjaGsxtI63SGoCpauQMSf
 pTDeXBvd0a6Z/XVJLh0VN7qFGb5D/QNAbDOdP45b/ijGhZ/jt/MDVjeFDyki2FaQEyUcG59UjWH
 ZztvvXvdrFVPIb/rLapkXk+AiSElN8/7Xwj1iZFcFx1ZdYEDUpWbfPGASZxZutWEvhu23RhSIlS
 ONVzi+m0nsTnobQ39jmcxo85H+3xcvvxRR1EoHT7s68VJtZqiMI3VdS1McJaFxgXHfYxg5wqgNi
 f4cxBx4wHmhCCzHmai+GFZFsROVu+xRmPyGFqHFIgt+TGb5wWEC7w757DCKcKY1pdPmbBZKoapi
 EEO5Lg74u8XdyzA73TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_060257_627484_72A8EEAA 
X-CRM114-Status: GOOD (  11.48  )
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

The firmware-name property was originally introduced to allow end-users
and integrators to select use-case-specific firmware for the WCN6855.
However, specifying firmware for an M.2 WLAN module in the Device Tree
is not appropriate. Instead, this functionality will be handled within
the ath11k driver. Therefore, the firmware-name property is now
deprecated.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index e34d42a30192..0162e365798b 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -37,6 +37,7 @@ properties:
 
   firmware-name:
     maxItems: 1
+    deprecated: true
     description:
       If present, a board or platform specific string used to lookup
       usecase-specific firmware files for the device.
-- 
2.34.1



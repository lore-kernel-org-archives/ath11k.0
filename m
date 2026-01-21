Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D122C44501
	for <ath11k@archiver.kernel.org>; Wed, 21 Jan 2026 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g02eooS4X37Eg3/73OINNWI5q5Qo0hRIZrYjs1jrqxc=; b=riYODYFwjBVfXZVZUshN4OnDTR
	J+rzwWJkjp2uCObq2hIQCDClYT5YOq4+kIERgAZkS23LHjnr28ledVnvcs3h3UDiGvFDm95BcyYmE
	GvKEuVeQQdi8Vni7wPNQXuyBj8X5e8LxsvQA9PKbvlXu3hzvunvCn7UglCLz7jnEYGwVAyOJ02DEp
	nH0swS/Mc+es7q8zfRxmLoOn9vxEiDBqIVJh4iSd+GO1x7j2v6Z8ZcEZckAwzCORXnzF+R+QJKhzL
	jksKlKAyin/D2LptVU4bTb6eKhr/40bzqc7GBbyGIsc9B8RINWC5RYO9T3TrzvHkrRMWctp0KoeaF
	XcaIbeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUrp-00000005DU3-1N6a;
	Wed, 21 Jan 2026 09:51:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUrn-00000005DSy-2mJQ
	for ath11k@lists.infradead.org;
	Wed, 21 Jan 2026 09:51:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6EMAK1530068
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g02eooS4X37
	Eg3/73OINNWI5q5Qo0hRIZrYjs1jrqxc=; b=DTo6k5pFfIkP/b1kAGFTkw+T4Cl
	PwQG8YYPuETSEi1ixptZh2+t7jEOu/b3ayvXmuvJP5bFHSQ34nuoBfRYELjJR4H3
	f04Pg7owgJgL3naHdYeVyFQZ9iQXCy36/ZSov7xDmpPNuufARg8/5IdKLeW4TZto
	1UGSa02lRFKm2zAMygETnOIz2/Wwb6qCbbzpL+9aaugCZ0DYrBb01HRVlzDPyKhj
	JIbzVbulxIhZ5l4HchkD+NqZWuCISSIY3HhAKf8jaG/7+xE4Bp2beTpa4qPZk++9
	AFOtfyu5WV0qrKihZ/lXSv3h0l+o21ZLvbHeZjAt0O5z/xDdK8WC/E8ECEw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth83jqjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 09:51:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so3965177a12.3
        for <ath11k@lists.infradead.org>; Wed, 21 Jan 2026 01:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768989070; x=1769593870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g02eooS4X37Eg3/73OINNWI5q5Qo0hRIZrYjs1jrqxc=;
        b=KeYaluESdVIkwXmCHFxDe/Yi03c8gRl4pZh8pYaYK5SFykM+bY2h0woApy2CyedVIf
         2XN7urJqgpEgAMUso7n28eSnKGCPFo2WO0Hmt6Zn70KDge1phBeKeKO2nBR670tR3Rwd
         HoKONh2Tj3vx1ckyYNw5Bi0juEU/aWse/cXfwj6ZoV+vsvmEO/pf+wEsgKW/HaHiSQ0H
         1ZTh9Jgn94tagB5IirAAZUgFxAsP2GN00/RFlzdENYzjjPUUXZiAmCWJeKBQwpbcIifz
         FzCkFEzFKuKHlVKbsvLmBq+uquKijdKoKjSvDRNmsH3+rFHl2c11hLfOa/iGAqZei29r
         ngpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768989070; x=1769593870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g02eooS4X37Eg3/73OINNWI5q5Qo0hRIZrYjs1jrqxc=;
        b=BDmeITlwfjUE02fL2p36PmQ3oD0WrkOrFmRLz9NQMKbKFatOBi+8PKSOyMib82D5WG
         BV4TC75u2AAnJVT2lwIrkOJfTnKHIVzXnDqKwEpAWl5vQrD9mekojVWtKpWbkFJCXjv4
         6sr49D/17eZczoRXIWfjs4fcSmGb7N8aCynfGzunpOABHymflzy3xmELpS52FRi01Lt9
         5Rrg3MwieTNIkSDVwt1goWxFNnVWzUIY90rxavZFehbKodN+6IKQ/4jVG4KrqfoW1Md1
         CP91QNAK5lORmoWQIpo5UwpSkdu5lZFlIDDis5iRt7Benlx6Z8Ih7QGdHEKvdU9ArtCr
         /8kQ==
X-Gm-Message-State: AOJu0YzprHwXcAoWZi4eHjmpq0vGiS2MU7z3oNjAv4u8nC5DSzX8fvAI
	Ypgl4AeQ8+mKuuCCj9L45/tQMI0E0H0M/FmPnGpxoyFMHVjRY3tqLXQYuhcWGKD4E8aT36uEOGA
	P2+BvE8XKFoSyexoIpEdLONZF88Rr0lZwyw/p2FnkNHcmO45ecnhOrC84FXe+JFiu
X-Gm-Gg: AZuq6aKIA+yC4GNUiNY0if5WNMFUm5P/+8hMoA+r3vvRINhmWuvk0EUsQOUjE8pYEHP
	I2/b/D/4zP8WAm8pq8tmNMIgfqbdO2GPpJNIN1UidHrJqh6xdo81oKX+N6ACnklPS73exmTIeY2
	RytiQ+AJAiXiR1t4ni9YYfR+KGOQ2/S8lWbIf1CM5i6kimStVpKzfrWYzzseexpKd+ByrZH95v6
	Y9MmJ2U31xxlDNTXAaLDxHjHDvg3BqjWl/kKiNgky/oguHyoffh3ee/nJgpXtjx+BS0yt1cpnvF
	Pw9Bqbd/zHxnV6G7rLMh7gwES/My0o8GJq3PKjKyQWzMgQMlhiN+RtiXdg3W+DnnNycllHKvhUR
	lHnrZQmOGoLpIBLnHPn2/FM3hrPagykc2y6cAHcYoo1kaYqzpMgzY14MSHoVQVp1idyc5
X-Received: by 2002:a05:6a20:7485:b0:366:14af:9bbd with SMTP id adf61e73a8af0-38dfe7c965amr15559364637.71.1768989070492;
        Wed, 21 Jan 2026 01:51:10 -0800 (PST)
X-Received: by 2002:a05:6a20:7485:b0:366:14af:9bbd with SMTP id adf61e73a8af0-38dfe7c965amr15559346637.71.1768989070019;
        Wed, 21 Jan 2026 01:51:10 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678af047sm16997295a91.10.2026.01.21.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:51:09 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonas.gorski@gmail.com, krzk@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v4 ath-current 2/2] dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property
Date: Wed, 21 Jan 2026 17:50:55 +0800
Message-Id: <20260121095055.3683957-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
References: <20260121095055.3683957-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Aarulr1qS_RYE8nc1g3jYoiujVorrtJj
X-Authority-Analysis: v=2.4 cv=TeSbdBQh c=1 sm=1 tr=0 ts=6970a18f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gumsBO624h-QSWVlTkIA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MiBTYWx0ZWRfX/bUVDiPP8KXf
 5IwsqI6T/PhK2EzC8ZHvulRbNtlS/DwMgkZ82lVgMVLV6Mr7R5irEW+E/ecYqNQf/jAEAE4kP5V
 Lw1UjWyfTaS6oske1YVOuum6R25+20hGR3dBsVXUZ1BBsqQpVrR/90wniusDISBGp2qKyOAzhmW
 fvRfPoKLLKs9sg5WgH6KDKdmAqj2rL5MZx0HqQ1jeEHC/kDdQZC9xyfrNr4Rz0TiysxlV5jT7my
 x4WBsp+MwYL+6Y5Sf7McemvptO0zXbo/Wo6WUtmVD3CffuZalPQwo4J5HwrBdR4/cN+1r6jfJPt
 LPltYvPmXoKCH53LRSoKK9ZSuPbVSWrAs7HBb4KUtk4o9ncr32xhCVtiOwmAMnJ1EfARuiFIu8p
 4STi1B1jHQWKRP2pV5p0ihw58cROo7PzKW+l+RZu8NZpyz87xLstUeKpTMlMx/283v4sxafyynQ
 IAyLKzh08HxVEj48Ffw==
X-Proofpoint-ORIG-GUID: Aarulr1qS_RYE8nc1g3jYoiujVorrtJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_015111_710336_EC38423A 
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

The firmware-name property was originally introduced to allow end-users
and integrators to select use-case-specific firmware for the WCN6855.
However, specifying firmware for an M.2 WLAN module in the Device Tree
is not appropriate. Instead, this functionality will be handled within
the ath11k driver. Therefore, the firmware-name property is now
deprecated.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



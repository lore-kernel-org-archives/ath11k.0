Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C961ECAAD2
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ld8OmSr0JUbf04eCkY9SiLe+Im1npzdXM6RjQjnls0=; b=lGVSGvgjGAgHqv
	Ixkx7MVg7i0Q3LTU/lOBqa2SNUZ/e+HohCLnlHmPmat/WF+Yx7ZDY2/OamJOjcKkn3k93ILqeYWbT
	uVTkDRlh676ujTMpjnli8znvEbFzkO1jZ9xZdE3mCvSKfyqRBveUqmyj/Bw4/ZtnpEGqzac0AehGl
	pT/OzfW64AhtGGTNr7mPm82lGnX7xa6W9c2xH8mdFPZIoAs6VhD0Hd7QBzJqSTSiq35i1gwWCk6X5
	Wmgpz9OAKH1ObldZaDi7IwAhudjCzQGbIEAl33iEoMHlhN6lp88qqwfyjVtFUlg34ZzosLTBQ62qj
	VsTk0fCUEPKQrc6gxH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSe7a-009jzM-Jx; Mon, 29 Aug 2022 12:44:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSe7M-009jte-Sz
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 12:44:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TBQEpF021570;
	Mon, 29 Aug 2022 12:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=cK+q4IMfolQrGElm8ZRsIJD8/YAVzHULObkFxpXdCeM=;
 b=DxcN9KbG0zCe98LX2FMR1XAeSKbjmnhTwBxizH5Svz7t5QWEk1w13IMlIalFwrntLdII
 H/WwOiPa3gZr/pVPPV3w/H/0aiLQ7VHDK5tVP44x0C3up5I3Z/17HfGRCObi77dcDYXv
 +X/s/grI+C+eNoSTq6Cy7ShAH6n0shlsrZRelI3E5UWknowQvtg3KhSUzqU7WEH0W45c
 3Mpei/WnBrB9n9SzUi2peZzhPHPibFQ+4cotYXj9QPJaLLxWAPbMv35q3ai54UHXxyGf
 nNh3pC8uefOXAOdQbC1MrDepeqlq6mgK6VivxXRDLrm40MxMbOzBB7hahmF6mdPp4oph ZQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8vjgg4yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 12:43:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27TChkjm005262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 12:43:46 GMT
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 05:43:44 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Subject: [PATCH v2 1/2] dt: bindings: net: add bindings to add WoW support for WCN6750
Date: Mon, 29 Aug 2022 18:13:22 +0530
Message-ID: <20220829124323.26874-2-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829124323.26874-1-quic_mpubbise@quicinc.com>
References: <20220829124323.26874-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lJ4p90ENCA8aIVT9tkzp1CR1Dh3tfCz_
X-Proofpoint-GUID: lJ4p90ENCA8aIVT9tkzp1CR1Dh3tfCz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 adultscore=3 impostorscore=0 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_054401_278809_0A361F5D 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add required bindings to support WoW (Wake on Wireless) for
WCN6750 which is based on ath11k driver.

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 .../bindings/net/wireless/qcom,ath11k.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
index a677b056f112..307a5b9d1588 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
@@ -66,6 +66,14 @@ properties:
     required:
       - iommus
 
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: State bits used in WCN6750 to signal the firmware
+                 to exit from WoW.
+
+  qcom,smem-state-names:
+    description: The names of the state bits used for SMP2P output
+
 required:
   - compatible
   - reg
@@ -410,6 +418,13 @@ examples:
         };
     };
 
+    smp2p-wpss {
+        wlan_smp2p_out: wlan_smp2p_out {
+                qcom,entry-name = "wlan";
+                #qcom,smem-state-cells = <1>;
+        };
+    };
+
     wifi: wifi@17a10040 {
         compatible = "qcom,wcn6750-wifi";
         reg = <0x17a10040 0x0>;
@@ -448,6 +463,8 @@ examples:
                      <GIC_SPI 799 IRQ_TYPE_EDGE_RISING>;
         qcom,rproc = <&remoteproc_wpss>;
         memory-region = <&wlan_fw_mem>, <&wlan_ce_mem>;
+        qcom,smem-states = <&wlan_smp2p_out 0>;
+        qcom,smem-state-names = "wlan-smp2p-out";
         wifi-firmware {
                 iommus = <&apps_smmu 0x1c02 0x1>;
         };
-- 
2.37.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D2DD1D87E
	for <ath11k@archiver.kernel.org>; Thu,  4 Dec 2025 07:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5dN5yZ9ItC8K4kgYMQf5DsqZ5QTAm8KkS0z5PvBi2w=; b=u9XtJ7JYkT2OGy3EAtdpKUViaM
	+cibDT1AbfV7/EbLuMpgQ5WpCOJPo6jlPh8mNcA1MjYLPRT9Y228soAdk0Ceyavb5mPIhyfM66civ
	gglwvsOwtT1kP2e+die7rIilILDzdeRAgfSADg0QBH3ytm42wTNcyOapTWu+ZQxCOfax2rDeZEka/
	ghCLs5jOUI7MR+zwGuAB0JdNO2t3q/Q8caFds/x0kTrhwG0YUk7vIUet3klBEWPljjTWARwUCwfgx
	bpT1DYAiWsP5Vk14ZnnAeV3o5VZpXt36soSPzqTWSB+2A55j+kzKu/bHEOKf0rhGNZkRWYatAzye0
	ukLMRefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Up-00000007b7W-1IWi;
	Thu, 04 Dec 2025 07:11:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3Un-00000007b68-24Qs
	for ath11k@lists.infradead.org;
	Thu, 04 Dec 2025 07:11:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B469Iqe825019
	for <ath11k@lists.infradead.org>; Thu, 4 Dec 2025 07:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X5dN5yZ9ItC
	8K4kgYMQf5DsqZ5QTAm8KkS0z5PvBi2w=; b=fKFLdc71YwSnEPot8G73icRdbIC
	upzhNi0Ezvuc6NmDSoQLFY7kpPswZ9vyJ3oIwAC66yC40336Vle/xRWwKn5buHt7
	SrErJZUDsdIYxbcOWrfCqkbV0q2XkZ89KJHH/Bg6PQIoA76BbNSWbO9RjvRl7qqf
	8WKSS6S4PE/Fy0YT7ZjVMmo76K2ZUy1R/rgJUuj8o7Mu/P8F/wI3xilCM4ZVB4kJ
	jJJiP/EwFg29wqlacYMjlDwXmmZaCqvd4SFmhNo8BkRaywD9gsLz4OhuXsAK0XB8
	vaOwUESaJwIskln8Koqfehy7DgUA6HTfZp/0OphRxxavvbVFlaCmiMI9dhQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atm12b4c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 04 Dec 2025 07:11:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b8973c4608so1662291b3a.3
        for <ath11k@lists.infradead.org>; Wed, 03 Dec 2025 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764832279; x=1765437079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5dN5yZ9ItC8K4kgYMQf5DsqZ5QTAm8KkS0z5PvBi2w=;
        b=bfYgmjTWZQnmJn9LsRkNC/EyncCW51i4wvBnrPtl4q1CgqePU5JF5gPUUJqKTmkeX3
         MHw22NPKO0+iklmJuDq79p4YNZKjBOUIrcdzbZCEZtwkDxy4aUCAH8sGCytFFC2BdtRt
         hOn4qYZoozNt7++rvtHz5/jSXe7q685CG275tdJZHdrXrftHbk/b3MmzjHUmDXYcD0oC
         cGyLW3b/zjATjOSi0eei339DIRp+7jXrvJcYEigVVocXvsN84J+u6IgH8yRmgOsItHIy
         ha5LKtzwK+cNwg6bvIZD450hQHtq142QSn1JjQtqHx0pTJmOHKer3G0oelqYapFS2zd+
         tEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764832279; x=1765437079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5dN5yZ9ItC8K4kgYMQf5DsqZ5QTAm8KkS0z5PvBi2w=;
        b=nRfZY2uuGZUjzgHMrJKw043OjnWfv4u8falDFxB6kwv206yAi0ptOpfB7UM7dj9ofD
         atIjaZM1vZAuX/3/YpwxGDdmv3l6Pqd7tgVMoceoHUVv4LtB4n0KB0E33z/7YxYGnhZn
         Opwjdzn0fLf/rnjX6XKB8ouKpRZ6++3msQ/foNbg858/RGZlBPdU3aJYO/USZUrs+Jod
         ENL4sb3nHxzKMcaz3PooA9XP+Q9Iqm7RWnmzLgl5x16JStiV7uYU3wxMnKNOgzJO/nDw
         n38FDKdEVecKgqWdUG0KZJU3klHRUDGovJUaL3sNj+6fWu8lxeaT13TA/+yHsamdXoqn
         hFCw==
X-Gm-Message-State: AOJu0Yz9oNE3abx23gXBxK7BfH8dRDmdZgyUWM3bWAMQZbPYTDyCebp9
	V4i2ZnenEl6VXVu8oDEdytEI/aswq/MQCvH7T47QlGMznj3XkDDjdr3aaAW2x+63LnsBQYto4hC
	J1Vnf8Cj230et8rWuk7YwC9Wb0a6/h+QMdVZQMePgQ8ZS0399COwMBPTJvS8s/Jwx6nwbT+qNvm
	A=
X-Gm-Gg: ASbGnctHNt4l1/Ym3k2j2Ws3mRSyMC50V8pyKzuhqpgnJkUunKs/YrziVUerWEghzkv
	SaoMERRjezZKiMZZc0ReupZZrEs6/WHNi7q2Fbi6+sWvQz3UZlwP07iFiQR7W7gCoBENpv5UptZ
	9bZ6TfGd438O3a8X/yWB08QtzW8uUjMp4KkVT/2yTXUpFB+VB0YT/MgvmCWmITajFzC5IQWbMQj
	cTnCY4xwhE/WZ1rD3A+K6PbU3arHPlV+AMxS3y5acNjKvhg9j6Ozk0YkiPsE1Yi/NKGT5C+U6P7
	VZYhnTdNuaEwagy106X69OOvq2bggMHeVn5KhlgDDMzntp8+6bB26lSS2GfEpvPOUJ8qs6tH5K7
	14EBQkKpD5YhOLkGQcWSyAo6peweaMC2lSJ3h2AP1shTD7PTep+HWhBGgAJ5MqF3To4PC
X-Received: by 2002:a05:6a21:9983:b0:34d:d030:6739 with SMTP id adf61e73a8af0-3640384fb33mr2392096637.31.1764832279061;
        Wed, 03 Dec 2025 23:11:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRimZYOSogE6sc3Z8nzoRkgTMJ+lV0kNJ7Xyql9Svm92IYE3Ca3TS6TItapIHe2OVC9kCfmA==
X-Received: by 2002:a05:6a21:9983:b0:34d:d030:6739 with SMTP id adf61e73a8af0-3640384fb33mr2392072637.31.1764832278645;
        Wed, 03 Dec 2025 23:11:18 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed331sm1117470b3a.4.2025.12.03.23.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:11:18 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current 2/2] dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property
Date: Thu,  4 Dec 2025 15:11:00 +0800
Message-Id: <20251204071100.970518-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
References: <20251204071100.970518-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1NyBTYWx0ZWRfX6Gd1teS9NhWp
 YzlLVb561IyL9AThkOQhZmpTUJbe41QU0fslcdtD1MlaXwN96DLO4aRHlN3cnqhDg2C6jJiRGxU
 c4+MMumoN3KEu7cTzhdZgs9DCNDhga6n0j3e7e6MRTPVOeuUkvjMHpZDJH4zoKBPubo3h1DRD0j
 oo3agzvfpjL69TXUFS14sMUBEAxH1EKeLz5uTxSB3Fvj3zBFJMqA51UhXhE8uzVUccyzCCaVW+9
 RrzJXmCa9ElJ2NALKf66gg8UF7ieU6y/55WJnlzeBjaClgqiDL5RsImp5Mk9JX4BAIDDZX45dEN
 pV67V9DOj5hVd4ONsgqEcfX+lCVbTNFOwLCyQz5FlbFmsTDzGuBtp/tKnMr1hihAWkfTv3Jfoio
 TOXAQp7PojIePKkuVwTN+WI+BMULuA==
X-Authority-Analysis: v=2.4 cv=JY6xbEKV c=1 sm=1 tr=0 ts=69313418 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-5GDireV7CNCQn9VzVAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: UFcpb7fdT0Lb1SyVNefIY5clsg-JMyxn
X-Proofpoint-ORIG-GUID: UFcpb7fdT0Lb1SyVNefIY5clsg-JMyxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_231121_648026_94D961D5 
X-CRM114-Status: GOOD (  11.50  )
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



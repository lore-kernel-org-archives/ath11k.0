Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB39CC54799
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=007HujZERMxrHzIjqypoNUr3p/UZblbrCkLIdes8l3o=; b=zqItyJ8S4owbkSA+OTX5xm4m1P
	3QHoN7Yz6ww7xQ6W6omOPuMCm09cD3gFoBKgqOTnZBspqNwesy2PwbmoadiW0Deqks8VmTcz9RpdT
	RSz7Ichlof7/0kkf7kncUMRBeVr37uqnLDMgIklKkiriYQ+Dj+DTHWyFsUfiegvNaQ68eZZlpb6zC
	nukyPJeahLRGqfVCoBsa61qa3CGo/IIW8shrMqYmkO0/xN8xLjp7npRT0QLE6k9sOH9OML3WXbAh/
	ci2FNj3jCl2LH/OiOrJ0b5Ql3sKzHP9ImhPdPE5HJl2gZQZ5ih0gy3Y6q17v4NqIFJ6USyolIo0m7
	EH+3wo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEU-00000008gx0-1f9u;
	Mon, 19 May 2025 09:56:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx1e-00000008cvT-1t8E
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:43:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J98DBe029025
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	007HujZERMxrHzIjqypoNUr3p/UZblbrCkLIdes8l3o=; b=JBbUYamNM38KwTPw
	r5XpHHv0iGfIQvDD01T1azNRyfzAGyNaw8ym8Mz1hYs3velk5YZmKNFz5Qut1u5t
	8VexHveJsDty+tyJht3pu2JQAtK2yXi2pMDD5IbTihiFeczqnb//j96Zzqg7QlY+
	ROSr1pAw3nmwZqCln5iyu5KSMmosZPO2/5xYMyw43iTjKHxpjmSqEXdJ1SNVUBj9
	LRxjHbHyPfTVbagpfTZ361SdkVQZ3VVKVcjb82jj5nGznKnZhcZaLZz3lQJ3ijcF
	9AHKwlHr6v2+DMbbm4O95fHlRS3U2IS7GsDN+K1fQkkmdic7Wzr1HqosfBi52ugd
	lpLkqw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4uw2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742c00c9044so1111879b3a.0
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647793; x=1748252593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=007HujZERMxrHzIjqypoNUr3p/UZblbrCkLIdes8l3o=;
        b=MSM2GShqzxGWRKisVp4IehW7visbTAQ+moGLxjUuuGAGi15gEFbB1rpxr9YvaDD9pm
         3wTIL+2+U6Jqft7NosI6/Edk+BGqOfN88X4ZDp7TQixPWO772297UMtrK+noz4A9nrfv
         2zuMahfv7SyvsJTcqe2cT9/NC0FV/I2I3XKv3TsOs7qmXs6PlpPXkjd0u9XlNkR8rUfi
         yku1+JMpJEFr0r+6+W3hh0POgSMFWFCImyD+nObFDyrOiF2I2sgtkAkekU/1SI//Olep
         +3UheYnTGqZn40zT1MWk3+8eRiqQ3JvtqnL3X1d+5NGBHS5UJk1U9GmAyc9Kb1NaIqZD
         /53A==
X-Forwarded-Encrypted: i=1; AJvYcCVsY4jYAZB10aSFjcRp0c7zlnETA/nXN+iggUbEWIaO5l57vzheAh+BeQRLUVwHuQtBWcf5gpg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy5eHau1zFASMgTwho5BPXg+ofvFHs/f0YGZP+/IQPs1IqifI5
	2rsYQlUZH6D1GdJB8GcwgnBxBzK5J5BJhre6vN5GrIS6vB/tClXMnKhTL15RQrrH9tRycdxis5k
	odSa6rHhd+rKxPj7oo4uauKwpeW7gZBmg9fCLnb086EkZrQl6q5XamONtbX1dP+zF
X-Gm-Gg: ASbGnctmLbnTzfPDK2QAF+Xn2HSiGPEnT6as/dZbd3hddXA7Es6XzFmZCQsIeKcctqf
	/xwNb+I59I5Dzdo2BkegdVG3DyjDPndsb9/zIxtRKB2Fa+5GC+O60xzkPFjj8E0tysl1ZvsTypB
	9sARHWIe3ymMwp91mTl37lb4WlbNUsLtCQaNtnzfAvOJFHNNLWBZI4pqG12cS1X2eBRA+7thzjQ
	l3julXOC1S7Y+YqU7O1ogOBBfqRNlhxwpixHFtFMFLM0UjJ4zUYYm/cdaNcGFIPz51GONpHN0uJ
	hs/FRtzrCMdw2FbgjKP+fV7hksknkhVY1og2nfgIbTc8gno=
X-Received: by 2002:a05:6a00:369a:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-742a97c3f42mr20730972b3a.8.1747647793070;
        Mon, 19 May 2025 02:43:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXhkNUVJCPclqbk5uDEmRPDPDeQKruoNfbCs6qpmkg+bZyNb04iAyNCcxFGV8speQfO5QzZw==
X-Received: by 2002:a05:6a00:369a:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-742a97c3f42mr20730936b3a.8.1747647792699;
        Mon, 19 May 2025 02:43:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:20 +0530
Subject: [PATCH v3 07/11] bus: mhi: host: Add support to read MHI
 capabilities
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-7-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=2595;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zi7OTwmsvLq70tK/0cIBpFG23okfTeoXtRDRXjvsdhE=;
 b=TEAaS8SSMWUIFf9mqCpc4zHTzUXmCfxf8I/joGMUwXRWTbVXz/vK2FNeuqyqI6SiNvuSXkkXp
 jQARkBD4I/pCrfr0Zd/fEB6jA65pNHcqeK6lNpVJNg/6SNg0YM9raLX
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682afd31 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RrrhtRoog15GdRs4h0qzqBsf8Y2-_HTf
X-Proofpoint-GUID: RrrhtRoog15GdRs4h0qzqBsf8Y2-_HTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX9aeu6xaWz3bb
 PJsAf+LFVBm+vUBw2yEYdyXlG5Y+XPjTML7GcYpNkwSxyyR/uVQf0figZNE2+R0sqJSqAXO6Fhf
 vTV8sbAirxDTXZOFBAvobo5ts0qO7NbpY4x/RsUwilI0qKZz0A1FS2Ou/pVXUGLtytJlkFqbuTx
 2U6/63truzv+dryZ3as0W2TWDxQH+gcAVN7dAujeOWHF+05z9koK7JqKdK7RK+UpvlZYwd/Cqn+
 O3yNMJ661SZhOFz/BgpnmQkb2SAV559c4k1sW4N50v9D157aL5lr9jjoBT4HheusnI9c/gadOv5
 D9c9TJlBzDqzlcEr7bGf/sSChZ6eEh2Ue00A7F86eMdp6mXl+gmjR2wBb0N06gOBp+iDLxMnz2z
 PJSChqk06RoB3C3S8Hwd7rYkcYOUsEE0vjqB5hyM/mbTnZUJjZzyBSEnxdYa4pexSnocz/+n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024314_498488_8EF1DFF9 
X-CRM114-Status: GOOD (  15.48  )
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

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
located after the ERDB array. The location of this group of registers is
indicated by the MISCOFF register. Each capability has a capability ID to
determine which functionality is supported and each capability will point
to the next capability supported.

Add a basic function to read those capabilities offsets.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h    |  4 ++++
 drivers/bus/mhi/host/init.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index dda340aaed95a5573a2ec776ca712e11a1ed0b52..eedac801b80021e44f7c65d33cd50760e06c02f2 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -16,6 +16,7 @@
 #define MHICFG				0x10
 #define CHDBOFF				0x18
 #define ERDBOFF				0x20
+#define MISCOFF				0x24
 #define BHIOFF				0x28
 #define BHIEOFF				0x2c
 #define DEBUGOFF			0x30
@@ -113,6 +114,9 @@
 #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
 #define MHISTATUS_SYSERR_MASK		BIT(2)
 #define MHISTATUS_READY_MASK		BIT(0)
+#define MISC_CAP_MASK			GENMASK(31, 0)
+#define CAP_CAPID_MASK			GENMASK(31, 24)
+#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
 /* Command Ring Element macros */
 /* No operation command */
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..a7137a040bdce1c58c98fe9c2340aae4cc4387d1 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -467,6 +467,35 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
+static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
+{
+	u32 val, cur_cap, next_offset;
+	int ret;
+
+	/* Get the 1st supported capability offset */
+	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
+				 MISC_CAP_MASK, offset);
+	if (ret)
+		return ret;
+	do {
+		if (*offset >= mhi_cntrl->reg_len)
+			return -ENXIO;
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
+		if (ret)
+			return ret;
+
+		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
+		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
+		if (cur_cap == capability)
+			return 0;
+
+		*offset = next_offset;
+	} while (next_offset);
+
+	return -ENXIO;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;

-- 
2.34.1



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0EDC54E65
	for <ath11k@archiver.kernel.org>; Mon, 19 May 2025 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms4AsHGtqF6++l3IqWfdW5IwKyh+gOLE1wk2h0gxx4A=; b=KvJWzPmDfzd2xSyG8X7w3EFUf5
	XiFMqXSl2GGLFwv0vxycQGxNlAt/eb7JE6k2hogrx9uDpchNujSEIDqNrBzQmaM3VJVzlRc2SGrzR
	NNcQowPfCLefKQS96WS/N1ftWoQ7JgASMv+8u8J79OYaxOSuFW1YICB0r0wQyY+DT0OvEgU7YqIdJ
	OCK9BYLPD+FN7Ytz2u8w0KgHJnisCgFZMHMy5tcAbGh5MkNORapysDuJP+FD1UgQjeSvhownNZzco
	8eGyEFKWm2/071eNzokQFA13J+CS3ZTGZNm8fPn+lApUHyqN9SiHbaq5MeVT7vETqi4FMoVDoBqpb
	S1i7MmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxEV-00000008gyN-1j55;
	Mon, 19 May 2025 09:56:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx1p-00000008czt-36cK
	for ath11k@lists.infradead.org;
	Mon, 19 May 2025 09:43:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GcAU023185
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ms4AsHGtqF6++l3IqWfdW5IwKyh+gOLE1wk2h0gxx4A=; b=RS+YL75NsAXYwD4h
	vOPSfO9/6++DZ3QSQOHFI3BvzmyhvOLwftO0SdfpaojVaKKwo+DLzSzf5UAMdrTC
	dVp/5+XMAzkHxzkAIj1asWiL4ieyPHUAmeGaIZeDfdiuNd5CpGhqAF59dl1CJj+z
	3azDRP8Pb6ASd0YVDXk6hRUn5qE4j0ZPh/WvSx3yXiaX569rqAPVzC8FOsEhIK2G
	7kr1WNkoE57X30ufXmItEnIG0xJcM1YbN1b2Xmfz/UVoGab5Khn8c+Q3NHNe8uIL
	DBI+TErcBCECOPK+P5C0pY9oXss+JRRw4c0mPVh1/3mx7xe+sNtVOURX8Q7WwyDg
	d5n+NA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rdt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 19 May 2025 09:43:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e0fee53eso2351541a12.1
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 02:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647804; x=1748252604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms4AsHGtqF6++l3IqWfdW5IwKyh+gOLE1wk2h0gxx4A=;
        b=dkOJaTyro1jv+wDjezn0+V/VUFJsYHsb/3Ml1JuR1ug6xwh6v4Fcqa5GScL1hSmNKq
         CxHka94Z09VUE6HMzqSZvo4CPZMpZcLwoA3laB643bBNxEB1GeLifm152PFDz7DWK/GX
         IvpcQrBn0CYoeyYV6IhZ+S/3CYhkyAIpoayFUIl1WmXaF5UxeNMrEtz420zSLZACqtyC
         eePDNBcfuS326f6Nj/xDkeVlhhjNSqmTLyb79dILlAggqFRAbdjQc/wDBzArqxF9e1Qz
         KWHYLBPF3kEf1crLfGvsROEkUV1rgbXs46vJWiX0ye2dkvUypdfxNiB9ztTgIEOb/AT8
         82UA==
X-Forwarded-Encrypted: i=1; AJvYcCWYs5JVDiu7PlZhWZHgziwioKsFSk1XTHBl376b53WXqb7pmiq3Zs+uc763p2gxuf71DFvQ9ZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLkjOSONP+6GqLj1qPqelkyIlnRTC/LGzxUbkUJ+EfXOzu1gR
	DIu2Xc0//riyLSDzn+5qOUM1NeLlOu8MnCHCBwfcLQDP8baypVlNN10mh2tSg0WZD3BrDTyDmzI
	AJXX3JCyAoNHQ17cBUxyo4AR+Pxffd7fq9lhKbg+Sp53+rws+7dqUr0tcC2CuP2/y
X-Gm-Gg: ASbGncuc/o27oaD8CvMkeks7ajlp1AGoKYRKBQ4EppLZ2u7+mOZ4PPfcfpEcizGwHnV
	CC4HP9XevXAzxppa0KdfLZRhmmET9v4DDxp8+u4BUDDV28bDopLlREWHU5cKRrj+hh+s5DO9XMr
	FZDW7M0Hq4C0kYmmEE28UcOkUTH/RYeZqA86J6BbvXxRbeel3GynvM1iSeJ6SQM7sYEk7SzhRf4
	oqUoCaLy4ni/CydtVX+ek/LuTYxR93mPexFs2ZCVrtiGzCiTjfbV5/wIq1Jp7zGp6UwLgk4K2F7
	7R8ca+FNY5BBlJ+h4EyonJfE+AE6rvHUGJmSi7Z1b8Tw7QA=
X-Received: by 2002:a05:6a20:c681:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-2170ce8c064mr18624932637.37.1747647804343;
        Mon, 19 May 2025 02:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8bB3sFr0+tAayp3kXPL7kM6eemjerF+In7kpKG9A5RQSxk/YcDRJJ2IJ/dU+O5cjxvqLww==
X-Received: by 2002:a05:6a20:c681:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-2170ce8c064mr18624902637.37.1747647803999;
        Mon, 19 May 2025 02:43:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:22 +0530
Subject: [PATCH v3 09/11] PCI: Export pci_set_target_speed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=732;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xsy7qnLw8evkZCbeD6p1+RvCRcE2R11sd9iRKK+i99A=;
 b=RV/zKoNt4pz2Mou112fotyg8c0PTbzunkvtBsWXq2bk893o8qU7lN8dMiEzhxdflw+gCEpJv7
 9JVlb2oi2ZZBJOg4cF+FTL8G8iN1iD4P4HAC145b5z3tE5eyuOK7RZF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX8Z5t26ic0YeG
 /T6JLW65oN2lG3SOWt0ZneRkS2Al44kl7DXsEfnTBWC98DOrdY5/OCv7OGGe1nmKlrGFb4IGcyu
 z2wkEM40dEPRWzAK0113ToR7QWH4sSohhaEeHA5dOQ+T6LHHC3Fe7gV9GXxXCnDvMIH0SQ2z9tg
 lSAuFCTuK8mbNXMfDqJEoP08yLndwDNZhw5ew0zhak+STHCKSLj3dDaPQ6CjYGoFq58iJ/8f65M
 yyDb20JVPJF2Rb2NugPkLi1e5lo32QjJJBRNzxrFD62+0cgRLRqPRUe0BUl1mjnglJYW2clcxoV
 QOsiC1kPfFPOG9lcvP5wjXVyif5P0o9uXf9yy1GNPnOlg1e/0nodCQbYdx29XrhBUeyKNvJoi0o
 d+9DVf1PvCbKlKkyqCmbaKq6KjzaQeZTRcUqF2zkmorIlpf3WBVf229vaQBvT/dizYhWNDur
X-Proofpoint-ORIG-GUID: ROWsDBpuajInpDqDfL-6CmUq5kBPqDtU
X-Proofpoint-GUID: ROWsDBpuajInpDqDfL-6CmUq5kBPqDtU
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd3d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=973 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_024325_791082_8A4F8392 
X-CRM114-Status: GOOD (  11.55  )
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

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3525bc0cd10f1dd7794abbe84ccb10e2c53a10af..02c544c6186b8c6b87730d1c924f07858571d2ae 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1



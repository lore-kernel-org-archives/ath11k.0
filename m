Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7DCCA0EE6
	for <ath11k@archiver.kernel.org>; Fri, 15 Aug 2025 01:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4P3lXv4/uPA7E/VgfMVu1UmSqEzdZA+CkvLhRV6TU5U=; b=jjv6C9SLW62x7F
	0sIwWnyPkl/awq3rn4voiwm+vZWI41EuiBOd5qf29EI/ZrLqQ7BZauM9YAiNWVnLsal5eZKaJOzDG
	Pb6u5hlsaALeTbOqBCon6rlVtkftQPlmiGyB78QUEHYLr0CbMaAkjw21K27dstAQCZjAR1fnJ72Mz
	mOspD81mhfBqLeOMNStztowRaUYHomIRLeqmoo7KndAmB5lRhIu17TgGuzgz64pLeRDNBWiZsKW8n
	1Y1gr+hy2ehC+vB9J9EHbc1+RMLALaphiHPzZ9PQ+tmAutB55//2bjyj01me/eeP2U16dZxg4pJa+
	0XjGBpnSo4e3ogo3FvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVV-000000013Ud-0bUq;
	Fri, 15 Aug 2025 01:45:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjVS-000000013Se-4B5E
	for ath11k@lists.infradead.org;
	Fri, 15 Aug 2025 01:45:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJfRFN029021
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4P3lXv4/uPA7E/VgfMVu1U
	mSqEzdZA+CkvLhRV6TU5U=; b=WS6Z9hB9e8LqSb8eKL6cdbY78dkdRjMB29jJWu
	FhiSmMzhbfAU7LDHmHQG2Q9zA5/bGGUK4LgbRSlagB7QQTGac+8nd5EA9tmQc2c2
	Ab5pgA+3V4NxDkxRJ36D1Qtr7iA5gvOAaeB7YNi6Zg+oE8he9a5eIYixr/W9NAdI
	SHh7CqKgfnTBPr7///9hwabIeF63aOuGVQkKbsBSxDwrGB/4XXe7YG0wjuG1/e/b
	2y6vxjNC+KUI2Qd9/0Fx9aCcdOgAp3/NpnU1a2O+BQGl+45YlBDdHV2dOXyRkZtl
	4ZUomUKDLJAIZJamQSiK2D/AXbuhKpoXAkhiNompT9C6IE+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9qa0qp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 15 Aug 2025 01:45:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581950a1so17911695ad.2
        for <ath11k@lists.infradead.org>; Thu, 14 Aug 2025 18:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755222314; x=1755827114;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P3lXv4/uPA7E/VgfMVu1UmSqEzdZA+CkvLhRV6TU5U=;
        b=vz3ra3Ag+Hek4LLG9CRMik6/rRAJoPeqjUPV4aJ6GC5Z0eJZSEzubvkhBFeSnjqrMG
         iadfvmIixV+FrAeXz5GyA50rY5WOTRoFoqjY2UkFEP/PXY4DH0G4Ge/utyTHh4WmMv3I
         EMwCmVvGpZrDW8aAc8Djyq9QC9mqCaZzJVhR6eLOcZU0ysqa3XE+L704iuL1TaVM/L3r
         YiZ8sU2FG4FmWED3piv823nlqwHEcBYhzxxuRLScU9yIwddTzDvBErHOYGUtv8HCdF5F
         DgA6VT/7BaN58WhzQ9B+qGl+CVLwxx3oE5FJSMh1ituEthQO2VxAtOXfXzU7P1GAu2Hf
         T51g==
X-Forwarded-Encrypted: i=1; AJvYcCUs3P3M4/NmNEVRxEZt1cOidpQ55PtKQ19zn17f9xeORUHXR4gBNBmMJvENgECKTEpq9PzJ/Ck=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0g+hVFeLnvKNtbCDIHHmuYDpuImsaYKBTn7IWVseFti0mcgCd
	vQpvGoClIECFZs+CSDLItKzZp839vDXOc/2Pi3bRE7L7Fi6wy+b4NnmBsJHvRQtAoiiNzhmQrSr
	atSbxmU7x2mWX/4pr+wjiUJSjLhuOkhBoKeuKHeoa6y682O2Q78glckuazlx9cZY+
X-Gm-Gg: ASbGnctbyBLSWiVGgBMCce/oUDN2HmvfWIOMDB/7oh+vTnTW9aourJ9+3e32Ie2Rc8a
	EzW62SeoGxrqC0S0Lg3PzQEk3cWmNL5N3fZyy7gSBSRdayz0+JoKrKx4er8QfaWtJyiz3i+4/Ww
	TVNMM8Mg1FTXX4mhBET291FmiXiSTvqnjMuPGhY2tBODqILr5mZyOt9jy42dzWJOwKw06C+mWfF
	H4Vl12kgRC3NKXQB4D3mBvM6ltiol8BXnLkUiKSmBhqa/MjgAlH69dDhWZ1YbB46dIaNnzgC6jI
	rFzNqfgg5POmF/9HRdY7MX9wqe5+dyKUgf4GRVvSQYprWffpKh4NaUttU/xDwnSx7/iPc/76csd
	f05NtwfGVrttsoSES
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id d9443c01a7336-2446d715b0bmr4579985ad.14.1755222314400;
        Thu, 14 Aug 2025 18:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqjJ5BnUL+tpWpRnC86E4QXEbco0IbzESSL4M5fmEVPbzVuES86olfGCLzLuwlUQ8m/AAbsQ==
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id d9443c01a7336-2446d715b0bmr4579565ad.14.1755222313913;
        Thu, 14 Aug 2025 18:45:13 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d7735f4sm20273a12.48.2025.08.14.18.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 18:45:13 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath: downgrade logging level for CE
 buffer enqueue failure
Date: Fri, 15 Aug 2025 09:44:55 +0800
Message-Id: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABiRnmgC/5XOSw7CIBCA4asY1k7Do1p05T2MCwqDJVFQaKum6
 d3FxoULjbohmUzm+xlIwugwkfVsIBF7l1zweWDzGdGN8nsEZ/JMOOULKhkH1TZggm/hoqKH4EE
 joD932CFY5Q5QKqmQW22YQpKZU0TrrlNiSx7XHq8t2eVN41Ib4m1q92zaPzPie6ZnQIGu6sWqE
 lyglJuQUnHu1EGH47HIz9To+b8uz67Of6+MZrYq8YMrXt3yB1dkV9SCLtFaI+v6jTuO4x3/AR2
 UkQEAAA==
X-Change-ID: 20250812-ath-dont-warn-on-ce-enqueue-fail-4a8ae2fcd1ae
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689e912e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nBwn2dWH28VFQPEByrQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6sVJ7J_UxDowcjba3icPIdnfQGLN9HzO
X-Proofpoint-ORIG-GUID: 6sVJ7J_UxDowcjba3icPIdnfQGLN9HzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX/y9UK0tvr4Gd
 0+dP55yKt64zPou0Z/fDvy4Puor6VxWXMMVqEGKN5DgrCmNFUmr/o/LXfImHuz2WvFfjAIgJa0P
 Ow4QEf7EtMl0wYWyVQWWa4ryI17k1Swk3+zt6G1JjEeuT/jYN/Q49jaBHgv1XJMaCGXPX4Qdv2M
 GVOcS/J6XWYs7PwjFMrUZoa2zcWcm996qryN1+bdUS9Qwd1kCxHxXGJ9J1+53A8dqP/Y7MmDxqU
 7FDwGKkEWLFkZ25OKTTu04QBElJ2cmY7IXheTYpGgqteB2FHRAod4bIWRcqD7dDf7iUj7NW1GlP
 9fWCxNuxzrMcupn4MxQ2VHejdhyDJqSqpcwCzW4OydOTWpbcXVyv26/lFRFdnuLMftFbmtBktYx
 5Uz49Bni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_184523_038992_940B3009 
X-CRM114-Status: UNSURE (   9.07  )
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

The CE buffer enqueue failure won't cause any functional issue, downgrade
logging level to avoid misleading.

Also fix an incorrect debug ID usage for CE.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (3):
      wifi: ath11k: downgrade log level for CE buffer enqueue failure
      wifi: ath12k: fix wrong logging ID used for CE
      wifi: ath12k: downgrade log level for CE buffer enqueue failure

 drivers/net/wireless/ath/ath11k/ce.c    | 3 ++-
 drivers/net/wireless/ath/ath12k/ce.c    | 5 +++--
 drivers/net/wireless/ath/ath12k/debug.h | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: 95bf875b89b48a95a82aca922eeaf19d52543028
change-id: 20250812-ath-dont-warn-on-ce-enqueue-fail-4a8ae2fcd1ae

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>



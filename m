Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D85E9A05E
	for <ath11k@archiver.kernel.org>; Thu, 19 Feb 2026 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=; b=aaXfzfptqpq+HR
	UaY/MnhSrB8z2Ij82BODfm5Sl3olO4uz399MVSdD+1zQMaUv01Zb5Dzd7j0o8x4Mvthh7bZhYUCqU
	uKxHij5xa5MSs9x2Fpy7kzgFtVekUDtuuNqE8ne7WbozTqsyKZq1L1bBpdIRb52aXe5NVPsLmmpkj
	QF9YJenfyND9smph7xQrmlAbi4C5zVzbwvJambp1/I54avrxC1865RFSzg6KMBdXR10rQgGMXpPki
	VrolDT9HZi8Bk41jOeZmp5eFMQuTdgsW8EZUXdI3b6yPsXZYbbUtPGxXGomFqzzjRdvDe5CfzwdTL
	Z3drjRkYMs0/akm7lyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vN-0000000BrXf-1GIg;
	Thu, 19 Feb 2026 19:42:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9vJ-0000000BrVP-3u8G
	for ath11k@lists.infradead.org;
	Thu, 19 Feb 2026 19:42:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JC2xKt3077992
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 19:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=17XK3meZ03iUdZqQRtoxox
	HX9Zd+qrkGcSktTTzYFBM=; b=d/YoCMPy3dOPOftDx6PKyh5Y831zNqbl3bgSE5
	tNQsbdMlSrX0VIEyb8wsG2NCoR5XgmamsqgheAxCxsgFtCOtIwvtQnWvAjhZZOWW
	KOqhYOdZa1uc+j4vO4CzzHD0zhsqe6/Knu3CjsAinJ9mQYxt8rNq1cYm5lZecwfY
	K3wIginPCaUvDsixSxFO4zHKzqF1hrIDgm5UiYBxiAI8r3uMJdCVXoHWLNQi/MM1
	+iei5YtJSncVUWWdC4UWIv4/Aj1d0f53feS9bZIIofS0ta4vIqK7PHPMVfzKkaz1
	S0xqLnF3p/0xM8vo+uo0i1OyLH/873tnxfhm5Jfg0xtjiNEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk82t9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 19:42:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad147cdf07so12948285ad.2
        for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 11:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530171; x=1772134971; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=;
        b=bx0LCqNwn5xTi/zEfWkXhSJKjtdBSukMz7K0/Fx9Rm08b3Pf5OIrstv5JPyFwoSosr
         utxepMs1RqC5RlatGrKjaOH2R/GJYhpBmsDu/+JwE86UQzgbYirc296CLsWr4WAOivnr
         ADxknlh7QIajEf36pTtc0tdhvtur3qXOP/PRqDjERM3z9qPLeP7/c/dZ1d2Tik3fLE+J
         72+FWEwz9VcNvfgKjdPNn60aRLR4pkGSGEcwikMIe26nkC+AU0D5YiYZIFce2FAMHbQG
         8mBjtOrM9SAIZfLLkRo9JZ7mhXXA8GKGmAbLpRuIDASP2+VjPKK9lc0tuwTFDwQYf5oD
         HU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530171; x=1772134971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17XK3meZ03iUdZqQRtoxoxHX9Zd+qrkGcSktTTzYFBM=;
        b=YL/pAgdgGLsjLQBKOfhDT8ZR9KzXOaymsU3f+I/fO7bc4XC2etahyDUP2Vco/vKSTt
         lNk5tIk648EvTA9eSZQ9yUeFxTAngzzxH5YZHf0DCo+1Aw4t3fOS3VCG6/8DkjFmAz5U
         emdsWkbtJdah7Kfg0DYwTlC9z+tBOOIZfsyPj6XmlVkpg/3dkOtqLVjtDm7pes00NOWA
         HG1tRRSMoD8ZCX9iwHaywuPEUqm71ocrUNyoBW9+n3GenXRfhLjsLyStD0La6KhMrROF
         ObwOdrmk3ed3RK6wUlPTvOQcRdgWoQRZYp33UBaF8JmgHAfdIaCV0xPqrub8lJzWV+5u
         zqpA==
X-Forwarded-Encrypted: i=1; AJvYcCXeDlHzKguqJIQPnkZY76zbziCWTvgrqwfPncDdDoUP0uIdxW+0ggn3lfCIDPR8U2bQacZ5u2k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTw7qk/6y5tVSY8fpdFEycZFnEECr92prN+/59BJi/O8o4UZpl
	N5SDZPRELdWignMD3bw6WYVEmdZQ6DB/lcvAwJgm7q8AY5aU6G9Fi128exZ/9pbTBBuz0cWREL0
	rG1d2IUVFuXjr3PIycGCp0PqHQ1qTNY3Rbz7NPvMqK/vDLczOSlQghJ4ojdSXiPQT
X-Gm-Gg: AZuq6aLQxMtFiTjGYm/Ok9UaiuvAHLonWxaHt4MfFtDdGJeRJp9LBpipicydfrbHU+D
	48wOBKO2u1XeDWUjcjrPkermv1NjEMl7eWibySDgUpHjJMC4wrWfZKqD2lADM2Ts9CRfNXTNDur
	qm4pRuEe0BFeRNW4+1ygco6EJSkh+wmF7DtEqwhKNE20SmelMMkugs/elppp0sZgDxo2oCooZaF
	AJnk3QmTShoon+tB0vQIkbG6UqIU3o5Rm7bpL23X+/VvFs8+ThRdGKuwsuXfRgteM3Uo5rnGIhp
	KrakNfN9kfS/6LP4rNPM883yDZb/vWfo1NqnwX7MuU0hKhPepiG6mzvx3VjjJGbD97ARBOt6DJL
	hwHAku8U3t2ONqhira7vNNImN+8A4QEhKs7yXO0btiRgBDQpBIS7NUdkfYxZGzlg83CrmmZ6k4n
	y+a8OXPexq0jNSuCaZyjhJ3H4LGQfpsZmVPWiFpzU=
X-Received: by 2002:a17:902:ce87:b0:2a9:5f11:3a26 with SMTP id d9443c01a7336-2ad1740bcaamr190724095ad.7.1771530171165;
        Thu, 19 Feb 2026 11:42:51 -0800 (PST)
X-Received: by 2002:a17:902:ce87:b0:2a9:5f11:3a26 with SMTP id d9443c01a7336-2ad1740bcaamr190723835ad.7.1771530170705;
        Thu, 19 Feb 2026 11:42:50 -0800 (PST)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a712ed9sm264404225ad.20.2026.02.19.11.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 11:42:50 -0800 (PST)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Subject: [PATCH wireless-next 0/2] wifi: mac80211: fetch FILS and
 unsolicited probe response templates by link ID
Date: Fri, 20 Feb 2026 01:12:40 +0530
Message-Id: <20260220-fils-prob-by-link-v1-0-a2746a853f75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBnl2kC/x3MQQqDMBBG4avIrDuQBLHgVcRFU/+0gyHKTKkW8
 e6GLr/FewcZVGDUNwcpvmKylAp/a+j5fpQXWKZqCi50LgTHSbLxqkvk+OMsZWYg+XvX+jb5SLV
 bFUn2/3OgTRQZZlywf2g8zwuoT+8IcgAAAA==
X-Change-ID: 20260220-fils-prob-by-link-eef176414f1b
To: Jeff Johnson <jjohnson@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Sriram R <quic_srirrama@quicinc.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Ill1s2FulF9Dn3irG-eiWvcTuRc4QRzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfX0ik7lDdN42bM
 p6YtXWtWIV28sRkNhBJa2uOpWQdyVuPLKXTKLMYxhFHRNSca43BGynkYZQNcI4g3+QVn1zBNP6X
 4LlAesYHTfgqjnsFyLfXAMUsPQCI41e654+nyuy4jBWs86h+StazGwHNyIkatl+yVWYC31loS2G
 xDsdMzKgpqao52iwZg/CHnlgXO2Jd818DEGgUpa3EGLgFDyMEDGZxe/1PZN6OojIotdpQph3Ar9
 DIdN2RY4BwrGO+czZgYgGG6RbjX90IoXHr04MoK8Lu6RtRjQ54obXkmhpfoSir6huzcO7I/oqZR
 UxyWsHen7RKgzY0JrriOIMkG9qOpn/9RJBEksIEui/X3GK6EHcZug8KwpQXHRO/oz9Lj0IrY/Fq
 JpesnOjliZccXh6mdDaUdV0fDh69xV6jNfmEpqI58LaBoZWaj7eoLUlpDurBHmLQiz1mTLbtVFH
 hl4OUJJMNj0i2C2prTQ==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=699767bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=wJPCH--AHzS56o4of04A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Ill1s2FulF9Dn3irG-eiWvcTuRc4QRzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114254_101226_E1467039 
X-CRM114-Status: GOOD (  10.92  )
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

Currently, the FILS discovery and unsolicited probe response templates
are always fetched from the default link of a virtual interface in both
Multi-Link Operation (MLO) and non-MLO cases. However, in the MLO case
there is a need to fetch these templates from a specific link instead of
the default link.

Hence, add support for fetching these templates based on the link ID from
the corresponding link data.

---
Sriram R (2):
      wifi: mac80211: fetch FILS discovery template by link ID
      wifi: mac80211: fetch unsolicited probe response template by link ID

 drivers/net/wireless/ath/ath11k/mac.c           |  4 +--
 drivers/net/wireless/ath/ath12k/mac.c           |  6 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c |  4 +--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  6 ++--
 include/net/mac80211.h                          |  8 +++--
 net/mac80211/tx.c                               | 40 ++++++++++++++++---------
 6 files changed, 44 insertions(+), 24 deletions(-)
---
base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
change-id: 20260220-fils-prob-by-link-eef176414f1b



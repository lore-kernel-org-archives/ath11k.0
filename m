Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5423CCF9EA
	for <ath11k@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aQEVU9tFm0FPokWAUJAaSIHV7/W0k+JNBaohFu7PGSQ=; b=yQH0ef2aKNdK9JOu05iWVFrpK+
	FexgiFZQDBiBxXlAli63fNLcORw3JtT4HDAfPmiBSJ65uaU1WZAlXPsKv8o/8H07rs+wQ5AGuN/8q
	qPEKeYRYGZ7SceJE6YIN4rKO0qFKQyBC05TATAyCOzobnlmRtgORzccL/Sn96PdRf7sgMa1x9cy04
	7dYYHQ1N7r5AIuf0ow/QXLvs2nvvymKl/TaGu7HWVxGvuRqnC6VKTidd+703G7AfY/wG048cGQx6D
	6JLiBXwyvwiJ7Yn7KFCoZ45/jmfdPfCv6FMwGwgxsR9NkcxTm6wkQ0+Ldfvyt968UcwnZgT9llvpt
	oXsw41CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKL-00000003SeN-3r7r;
	Thu, 30 Oct 2025 04:31:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKKI-00000003ScX-34ek
	for ath11k@lists.infradead.org;
	Thu, 30 Oct 2025 04:31:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLLAcQ1696883
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aQEVU9tFm0FPokWAUJAaSI
	HV7/W0k+JNBaohFu7PGSQ=; b=kA3DCIDWn/FTqPumzpfbVV7oYTcdTJC7noZJeg
	rc8zr4Q9ZojbpX/3lrVbO61DmALh1o5fnimaZin7R12/UWaCm2dOON/QAap1IxQ3
	b3h2UqkDBZcxMJNVtbyGm20eZDU/y/uNwQh/MKDkPQm+3n/YmqnZBGau9O88kCoE
	8jYW18xz+l9I/oXe5EOEdDRvcYZuADOUZWLRfcxAbiPRRfoaDxuWa1Gq4dZX/U4d
	EgoDz/HCXlcLfkITi4RvnUV/t65hpc5iUlxA7QRpTU1xUAzqlm9ZitnQqcm+wkCx
	LNDL3ecMknngU9l5Nuv8UJJKYj5HJrU+gEtpN2yd07M0PJkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv10rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Oct 2025 04:31:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6cd4d3a441so535664a12.0
        for <ath11k@lists.infradead.org>; Wed, 29 Oct 2025 21:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761798712; x=1762403512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQEVU9tFm0FPokWAUJAaSIHV7/W0k+JNBaohFu7PGSQ=;
        b=UMkWk7PwMPq1+SCkSwty8LVd7UyIeitFUMhg6sfefGYgVyCVcbYEA8P6ZdGT85KMtf
         3abWWtYIXLjbAIVW8hsedDaDgBwCQVC0jMJ6JADoaRNA1HV7UiClQdNVE/vgN0CTuTs8
         1wKCEsRXtI+TV48W2RI4OI9T5cU6YmpY0lT91H0fDynlYu4S4SUqZ6Cnavq8nemkmTVy
         2JsAZu//4EmuN43KwZYk7EmzXXD+3fIJETLLc5rwzftiyoj7uLFW9Vu2QtFRyu1OVCAz
         uBw9slIEydkVfWBlO2FI5n92wBaRUxePAvu3qf0A2Dqy1oadMYEblZXj/LoUyXjv1ZX6
         qnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761798712; x=1762403512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQEVU9tFm0FPokWAUJAaSIHV7/W0k+JNBaohFu7PGSQ=;
        b=eic1hlrQ2GVC6/OWwEwBcnHrc/jJhn+k8RAngtfwJi7fIZv5sPvYDxk9KL9J+DQYa/
         rfrBXmLNLorqNvuG4+VhWHUAwmHzg8DY5tV3JLY8RnHfoz46u9B51yiwnM8YZ6i1KPwe
         oIbeMqO3YD3ATbLGt3PLOccwtOhXFwCxYhvZff09cXOxA1z98QUhjXJ3wMoxJh2m1Sbf
         E1srndmpbm9GqxwxOer+0dL0531GszzIwNGEJNB+pZSMdFOoOxWQJsp2LXvndhUbdSFs
         4orMGDZ/5pwW4uaB6A/vM6u42GbYwZAc53APppFpiSzql08sEMJWmON2nKwxPhwo54w2
         yxiA==
X-Forwarded-Encrypted: i=1; AJvYcCVSulTQLdUKnuW4ryaoujUbuBEM1ZTta64pym7EsGCqrsXuh7vCU459Xp8ocTbeB/x1HaHD5YE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUYtVwLm23+jqA4I8sK3DiY+DT4yrQwBTXKOijUbPHdOmHL3ge
	kxJM4fYToWHjZMpATokHmCr+ecNaO2LGae2js0W1Wxcs8RPQZM8PScTOgP1/yZiATYPLUO8enjt
	tB3H3dv5ByguslbvCpeUMSwiyUqdzDrAG/2mb+UgLwd18l1VL7MJ5V8xcvyHqH05Y
X-Gm-Gg: ASbGncsQL8ZsGMg1O1phbWgSMDx0U9GqcxuefAp9T/CMk3MZx6cwOGI8LHNinu7n0Lk
	QoKD07B8uzLWUicixNFUkAQHzbOgNv2X+tREU/GpXCoANtDIClU/BewIH2vwj72NGEo9x5EVfIA
	D1XllWzoGgG8Mn4oQqd9B6sxiy9C+8kIV4EjKqJm2dMJQfEC/4pR6E42OlS+Bs4TJNBy969pU/A
	7Z8dFDVQqLouklvRVhaoDpLkI6XJ5DrUlLrYSv7xNqykd9ODTg6udyfE2BSXLgeJ2Tq/5ChmTBt
	QGOfiHqMmrldiV9Q+iiI7vRQHIZd5gpNbvHbxLa3XnXGZwA/8L6pR6NOuuSwKxXGKPQGOc5X4zC
	HoJ2bWyLqqqesLEnzwHiCkLHUC9Uf/soU49ABg1wC76tK
X-Received: by 2002:a05:6300:218c:b0:343:6c90:77aa with SMTP id adf61e73a8af0-3477c7dd7b8mr2428206637.29.1761798712200;
        Wed, 29 Oct 2025 21:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/z0VMIG9gpH8UZ6mNe5oR0sq4MImn1G2S9B/5BXOJDH9d1T5SvxKgUK7xufP2oppRGcUuQw==
X-Received: by 2002:a05:6300:218c:b0:343:6c90:77aa with SMTP id adf61e73a8af0-3477c7dd7b8mr2428185637.29.1761798711740;
        Wed, 29 Oct 2025 21:31:51 -0700 (PDT)
Received: from hu-yuzha-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409e456sm16912161b3a.71.2025.10.29.21.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 21:31:51 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
Subject: [PATCH ath-next 0/6] wifi: ath11k: Add single shot/periodic CFR capture support
Date: Wed, 29 Oct 2025 21:31:44 -0700
Message-Id: <20251030043150.3905086-1-yu.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BNjT-pjr1rHZ9LZ9JOUrjZBsRAH37WPE
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6902ea39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=AmXMZ5F67BFPE-8RLEAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BNjT-pjr1rHZ9LZ9JOUrjZBsRAH37WPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAzNCBTYWx0ZWRfX0rqELEo0Gz88
 9OBu7ENjs4FP8sctsm0r3rMlZ4FZQJv8N4mCrGFyO+wHtfgZhco1xQC9/pT3nt3jEEwNIoWG2rA
 zbuxVEoGdYWGcgkPdFoj1tS76/Z5R6SM8VpkSzvEYlKql0RV4PR1vbizrTCLMP1NLobmfe5Hqy2
 gfXLGdHpTXDLK8qmMIXTmmqvRSz3hFP+8OIkUX4r/yuyEmdQdHfxmshpzk+JfPgEtAYggVJb4tU
 FMW3hZbfVqbsIVYxy6/Zo3LMYEayuH2qBWlWotglQTopSJ48wRHWT1/k/wUh5iWwh7Iuw+WHTM3
 Q0NNAG87ncNcRZHsGF0ph2AKo59MlYm0p79UdIi87MOwboC2p2us/KjEVMAM36KuhDLLozooMCU
 5R4AxaH9CkwFrUT09Kr+CKwchl4Eow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_213154_799530_B5B0C3F8 
X-CRM114-Status: GOOD (  12.29  )
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

To enable/disable cfr feature use command,

echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr

where, val: 0 to disable CFR and 1 to enable CFR.

To enable CFR capture for associated peers,

echo "<val> <bw> <periodicity> <method>"
 >
/sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture

val: 0 - stop CFR capture
     1 - start CFR capture
bw: CFR capture bandwidth
     0 - 20MHZ
     1 - 40MHZ
     2 - 80MHZ
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)
method: Method used by hardware to collect the CFR dump.
     0 - from the ACKs of QOS NULL packets.

To enable CFR capture for unassociated clients,

echo “<mac address> <val> <periodicity>”
 > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc

Mac address: mac address of the client.
Val: 0 - start CFR capture
     1 – stop CFR capture
Periodicity: Periodicity at which hardware is expceted to collect CFR
dump.
     0 - single shot capture.
     non zero - for Periodic captures (value should be multiple of 10
ms)

To collect the cfr dump,
cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin

Previous link:
https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
Venkateswara Naralasetty (6):
  wifi: ath11k: Add initialization and deinitialization sequence for CFR
    module
  wifi: ath11k: Register debugfs for CFR configuration
  wifi: ath11k: Add support unassociated client CFR
  wifi: ath11k: Register relayfs entries for CFR dump
  wifi: ath11k: Register DBR event handler for CFR data
  wifi: ath11k: Register handler for CFR capture event

 drivers/net/wireless/ath/ath11k/Kconfig       |  11 +
 drivers/net/wireless/ath/ath11k/Makefile      |   1 +
 drivers/net/wireless/ath/ath11k/cfr.c         | 991 ++++++++++++++++++
 drivers/net/wireless/ath/ath11k/cfr.h         | 301 ++++++
 drivers/net/wireless/ath/ath11k/core.c        |  41 +-
 drivers/net/wireless/ath/ath11k/core.h        |  19 +-
 drivers/net/wireless/ath/ath11k/dbring.c      |  50 +-
 drivers/net/wireless/ath/ath11k/dbring.h      |   8 +-
 drivers/net/wireless/ath/ath11k/debug.h       |   8 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 143 ++-
 drivers/net/wireless/ath/ath11k/hal.c         |   3 +-
 drivers/net/wireless/ath/ath11k/hw.h          |   5 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  17 +-
 drivers/net/wireless/ath/ath11k/wmi.c         | 147 ++-
 drivers/net/wireless/ath/ath11k/wmi.h         |  97 +-
 15 files changed, 1816 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
 create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h


base-commit: 197498315de711140bcc4722fdeb7c1761777100
-- 
2.34.1



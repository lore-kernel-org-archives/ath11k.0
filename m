Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE2CD5BC8
	for <ath11k@archiver.kernel.org>; Tue, 26 May 2026 16:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=; b=0C2HGLTncSh9Xq8N4NRLopenZP
	nFsSR2C5qNFrQiGbWvRELl/IVKHlWp840BS0bdHhwNfKDq7b04zC7UmNMDntKa19TMiwDe83PiZfs
	hdutNp+fYek2oGnQGf00HtCMoGIhHIGU8XVPK24nsdeLYAfGV0t1+Ovh936lxloeT1VClj29Qs4OQ
	qX5PXcHyuL2NYwKc0llQrjwDQ/NeIa94FP7sB7IAXVtmYV5p5FzyhDmXL3FlasQTb1heUN+uUAMGF
	hAcU+TzybgPMfWmDmDuyWpWnAHYTRq7B1c3RolHevHkGMBOssvQ5EC4j/QgdOSX2OX3pfsMiWHcqg
	2BDNCipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuad-00000002VLG-1rM2;
	Tue, 26 May 2026 16:25:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRuaa-00000002VJx-2VJA
	for ath11k@lists.infradead.org;
	Tue, 26 May 2026 16:25:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsCWT2554544
	for <ath11k@lists.infradead.org>; Tue, 26 May 2026 16:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0i5VAlmRLgG+rEOSURd6M
	t9CnnTszTK9KxsVzAEs4I=; b=KuUbKLhnTZoKNWh+Kr7qo6zUp/C7vBmqaCcDmh
	0olPi26dIgkEz+OXys6OiZvQ800fjClvoDvj54GSogqhL84g15v7yK9N2CJZj7bD
	Us63pjPNnYW+f8/jS+r7xUYTxU1mGZXQeyStPHHM8aD8eFuwop3suyj6o6bbETYP
	ZB3alEZmm4GN+9FWZd4vgvNG4aCqKRReNtZ0bW0fD1Hv5lRnQGDr6P6FdkqG4hDA
	iE+nbe+kKylKPSarOMSA+se67XlrdMnfKEitiie9zejZZfClfWbWofLnUS8sd08u
	z+YYzt0rDVfk7yGCbqbUgPlUp3qfV26blrrt/kRlN/5J4PPw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tw9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 26 May 2026 16:25:07 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-135405e4035so910169c88.1
        for <ath11k@lists.infradead.org>; Tue, 26 May 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779812707; x=1780417507; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=;
        b=NqbUnhNwzOIVWdzQQNRSoP+N+CeCtnny9jzm20To7KhR4Py/Sf1JdV/YPQjVPsoIRe
         dGkul31zfYWhY295EEDiOtAT8RjNhQJ2ZFjuMv4Cvaf9MZeXl2x0rBhwX37WIholMFK1
         1Xl+CcGT1dtHOg3hWPOZcomqZfqgun1OCBftuGbSUpZgOxcNBvVIp0bKXWZ7Ot2A+e5A
         8ARUOj11V5ssyru1xaGCxSav0NQIBtyMxxdgeUUTalxhUnvQusigmzMqg1lm9UAU2dUP
         50kZy4qE7mre/xa+CWY6g+rAx+1BRhpf9sZTPCY4gpuW4ePUwY9C/0Qlj69ZfwAQ87Fq
         GC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812707; x=1780417507;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0i5VAlmRLgG+rEOSURd6Mt9CnnTszTK9KxsVzAEs4I=;
        b=pesGiYDhNL3bAlTsfoJIkWy8qUt/DtmEHBYWWnOSH4dIzOJRWVBz2OV5CGepQp4Jmc
         zs/3Zv/OjlVwHwx2AMlX9ovj1ad3kVquPG9ALlqJ5v82gRv9zat3NRBr+duKA4pYpdCX
         eFozGPOFjOt6pd1w/fhI3i2W5Yd8IJGd49mHdOv1QBcxqcr5/jizQaHtKfunAaLPyZuR
         h+j3/eRzEMlSPeaZbi8EMTZg2qZG6NGE33/wtuxM9og4cJmqCStzBSGzpIPPGQdwQXuy
         3vah5gWEAaB9zt5BliXeV7MTn/yLZ7HCrviTFtuZ88bODAVm1w8zew7T4L76tmOj1q0t
         vFsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aNHK0GeiDr5+UfzTdtbk66OJhVP4cjdGlO6uXyk2Et8OeBOLlQpvcdl3MPwXVT00Hnayw4fk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiuI8TukQDNLxXPoXxlpLacjDVgumFeyRaYKnhhwDkEfhjHGNk
	aavRd6Uz9PpL77ui2dN+i2BBGn3hFNFtN/hLjkQsjTJYxuRdZJ7CgFzH8tD44khUC49O89fPom5
	xxQgiCC4tUsB69OsGl5mhooUKD9pv6sQqRztruiEpWHMfGW6p6l0N89j9tZyy3Euo
X-Gm-Gg: Acq92OEM45dwDjAlA+wCUzzfclI/UkO4iSGL5qMq0iZgaaJjfBIk3Id/BXyfRRNwUz3
	jsmw9QoJ5z7yoiw9utb6GCA6ydKZxUSYt5qCBKl2EG9b4lIduHI5XWqF85oXa8u9zqNWoiuYX+9
	FdLFJwOXyrFtrAIMHVgEP8ZX0nEWo4VOmgCOUCFLNw/uSvzrGsTy/FD3r4rXeOcIKTKVoiy1Caw
	vjKVZ9r/kiihDp6rvcB3Diz7wZu2MgMku1eEsBpNKPkqmr862KnrjCAry8dLSZ7HjO3p0pbDBzh
	Legxg9m01JmhhsK6HN09dJfdLBCwgKQu3B5x8U3J8T1HuvldN82jMy+3kgRla1g+tBC7vvHIMa9
	dyLN6rUIQcy5yL0I5qjFMawwD5GFDXzPGNw1cOOOVLh9TjttedluXFTbY/A==
X-Received: by 2002:a05:7022:6ba3:b0:11a:3734:3db3 with SMTP id a92af1059eb24-1365fc6d6a9mr7904482c88.32.1779812706629;
        Tue, 26 May 2026 09:25:06 -0700 (PDT)
X-Received: by 2002:a05:7022:6ba3:b0:11a:3734:3db3 with SMTP id a92af1059eb24-1365fc6d6a9mr7904454c88.32.1779812705815;
        Tue, 26 May 2026 09:25:05 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm8721944c88.0.2026.05.26.09.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 09:25:05 -0700 (PDT)
Message-ID: <4fe17cef-7cc6-41fc-960a-385366861c52@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:25:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260526
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0MSBTYWx0ZWRfX2Yjm3QaYA93x
 oS/bbZ23aIRIM3YYwfkUR456OZnpBGBepDGmik9iLy6rI2SziGS9DswHGPEj/hrIAfdp0pHsG3K
 lFbTEf7J74nlNNRcTkVgxVDQB8aVjgFKEDErWVHiH1+Fiugv2LuWeAP2ucu2eG+FlU9fJqTzPz5
 pphseeLBo6N0cuoPqdhYMeNb35vWgOq5gWgL+NzvdzMcJ1NqEa0+e8fUOpMriBBzK1rHEsksgZ+
 uW6A5tNLsHvLbt5dsULpiE1Q+Ci5wF/QMpvYeR/hAVLGdwWgw66xE1nK4k/9ZWImgfPI6TGDRyc
 nx3nbIDpVentGZwyENhFR43+JnMWnEm1IQAUvjYl6aN360tDSM83P1NJUh/UYQdBuqp95nvkV2Z
 WQcqZnC3AiciC9/JLiUxKgGt2URrNGkFQlXUCTDkC3e0mXp4mV8fwQnY5ca9hTbGLrx7FInrYa5
 tlhy1ibsFHMpi+V1nZQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15c963 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=W5QCRmDefjtvIb0_0ZIA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 5W4vbSYn5gHr7YwjgNAbEgVrYlOQ3n1Z
X-Proofpoint-GUID: 5W4vbSYn5gHr7YwjgNAbEgVrYlOQ3n1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_092508_754178_1ED99959 
X-CRM114-Status: GOOD (  11.68  )
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

The following changes since commit 7baf5857e15d722776898510a10546d6b2f18645:

  wifi: brcmsmac: phy_lcn: Remove dead code in wlc_lcnphy_radio_2064_channel_tune_4313() (2026-04-28 10:43:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260526

for you to fetch changes up to d5c336161088c588f85da64f48ba6deead194afd:

  wifi: ath12k: fix error unwind on arch_init() failure in PCI probe (2026-05-26 08:54:27 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #2)

For ath12k:
- Add thermal throttling and cooling device support
- Add support for handling incumbent signal interference in 6 GHz
- Add support for channel 177 in the 5 GHz band

In addition, a large number of cleanup and minor bug fixing across
all supported drivers.

----------------------------------------------------------------
Aishwarya R (2):
      wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz
      wifi: ath12k: Add debugfs support to simulate incumbent signal interference

Arnd Bergmann (1):
      wifi: ath10k: drop gpio_led reference

Daniel Lezcano (2):
      wifi: ath: Use the unified QMI service ID instead of defining it locally
      wifi: ath: Fix the license marking

Jose Ignacio Tornos Martinez (1):
      wifi: ath11k: fix warning when unbinding

Kexin Sun (1):
      wifi: ath10k: update outdated comment for renamed ieee80211_tx_status()

Krzysztof Kozlowski (1):
      wifi: ath: Unify user-visible "Qualcomm" name

Maharaja Kennadyrajan (5):
      wifi: ath12k: handle thermal throttle stats WMI event
      wifi: ath12k: configure firmware thermal throttling via WMI
      wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
      wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
      wifi: ath12k: add thermal cooling device support

Nicolas Escande (1):
      wifi: ath12k: unify error handling in some ath12k_wmi_xxx() functions

Ripan Deuri (1):
      wifi: ath12k: fix error unwind on arch_init() failure in PCI probe

Rosen Penev (4):
      wifi: ath9k: use non devm for nvmem_cell_get
      wifi: ath9k: owl: move name into owl_nvmem_probe
      wifi: ath9k: use kmemdup and kcalloc
      wifi: ath12k: use kzalloc_flex

Tamizh Chelvam Raja (1):
      wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path

Tristan Madani (1):
      wifi: ath9k: fix OOB access from firmware tx status queue ID

Wei Zhang (1):
      wifi: ath11k: cancel SSR work items during PCI shutdown

Yingying Tang (1):
      wifi: ath12k: add channel 177 to the 5 GHz channel list

pengdonglin (1):
      wifi: ath9k: Remove redundant rcu_read_lock/unlock() in spin_lock

 drivers/net/wireless/ath/ath10k/core.h             |   1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c           |   2 +-
 drivers/net/wireless/ath/ath10k/leds.c             |   8 +-
 drivers/net/wireless/ath/ath10k/qmi.c              |   4 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |   1 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c              |   4 +-
 drivers/net/wireless/ath/ath11k/pci.c              |   8 +
 drivers/net/wireless/ath/ath11k/qmi.c              |   3 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |   1 -
 drivers/net/wireless/ath/ath12k/Kconfig            |   6 +-
 drivers/net/wireless/ath/ath12k/core.c             |  50 +-
 drivers/net/wireless/ath/ath12k/core.h             |  12 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |  46 ++
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  68 ++-
 drivers/net/wireless/ath/ath12k/mac.c              | 110 +++-
 drivers/net/wireless/ath/ath12k/pci.c              |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.c              |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.h              |   1 -
 drivers/net/wireless/ath/ath12k/thermal.c          | 252 +++++++--
 drivers/net/wireless/ath/ath12k/thermal.h          |  35 ++
 drivers/net/wireless/ath/ath12k/wmi.c              | 565 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h              | 125 ++++-
 drivers/net/wireless/ath/ath9k/ar9002_hw.c         |   6 +-
 .../net/wireless/ath/ath9k/ath9k_pci_owl_loader.c  |  31 +-
 drivers/net/wireless/ath/ath9k/common-init.c       |   8 +-
 drivers/net/wireless/ath/ath9k/init.c              |  11 +-
 drivers/net/wireless/ath/ath9k/recv.c              |   4 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |   7 +-
 30 files changed, 1180 insertions(+), 196 deletions(-)


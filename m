Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB6CD8CAA
	for <ath11k@archiver.kernel.org>; Tue,  9 Jun 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=; b=2KqcyZrOLQRKYzo6EQuoZmS7Z9
	0Ij2Fg7He2676hF4YmMt0cT7zRxzMqKUwnE8Z9DOEH3WJfRAwbi7FZJ3gr+TRuEpNnunpeqPP+3il
	m1figU3j0nBxKueGzzzUtvBhMxASCyuDzBxtR0bIul8nBtDmUjMESDSsomhqmxcGFnbN9q8/egou7
	vhxrgWepQD3AnM7DOKFrnybO1RfeL/uJlRhJDkLIi4tzm0zvoXYqA+x8RDSa6QBpbtPkopJz416m2
	VtW9X2bD4VeMljDCWOYhBlVrAZ4ityQhQ9Qg5zo4njyLJ2sYeV7kwuHucSuGFx3t8SSRGVY7IhzuT
	DwuC6Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxaJ-00000005nCJ-3PJH;
	Tue, 09 Jun 2026 14:37:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxaG-00000005nBJ-47gr
	for ath11k@lists.infradead.org;
	Tue, 09 Jun 2026 14:37:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmKRA2587894
	for <ath11k@lists.infradead.org>; Tue, 9 Jun 2026 14:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yh/qlCI4RSGheI4VM0m2qK
	RN3/NEqC81qg+NEzqwGBc=; b=ZfgrAb5g3zWFsoWEFyoYMCvs/vrkIJKHzECsPc
	tx19/cWZ3vzIZBdzaZFGze2cCrRcmEsWW+7QjJHQ8HgGZzLBSYg3Q3jl//b4mn4H
	pbm5cy/FWBZso6kVYKtQUu2jSsdKzi1VHXo9BTINYJnj1NLEpUQDYKPGaDhRT2Rf
	djnFcnLKbkclj+KxREWnriJxCUsVzWom8AWBP2cyhmy81sL4uQcUn3T0bCmHZc3Y
	lbtz6NAcxC9dq99N47mFBQhir85pv9tlsmioV/BAKDsT5qWmRnHsNFkue7fHBETc
	Hz4W2Mcc1jxgImldhcP6IEiiO3NY73ItlxGUVwbZqqv6+mEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4hwss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 14:37:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304e7fc90b1so5597833eec.1
        for <ath11k@lists.infradead.org>; Tue, 09 Jun 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781015859; x=1781620659; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=;
        b=HvDFLcXbrxqKrjWnqkymbDVvgBAre9GK861Cqf90Z1pNeYcfaYvHVO5eyW+G2BVTqP
         bP6Y7Dge/88P6JdToo2/n8HgTLEbzrFdSKw07Qf+4BalyYnO0iwm14Nq3siwkDj7tVZo
         OuSOPIZJlDnSw2u4bZ2jYUsYK9vxs3jf0zmpinOXCXHv0XGhBmN/H5s9ykjTaqS645JY
         n6SvsIEsN6rh+wBCnLFEP0A5gzt6pfc1xQWtrG55y9WOiV7VSjenIEb9BDfUsj3doatE
         k3s+fGOMDrgPENwaxxaSFm3betycJD7utCpH40I6GqszQfvzPfHvO25eVvt1bcqlxPGg
         wF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015859; x=1781620659;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=;
        b=llSQruD8tikBx1hSA2iLvaUXzBgLjzhfZoMBsKMe2tcf1NnDuHCdYj895NbNm99/Uj
         ZazH3j3t5seWn+GBAzRAlaDTmfF0ESxk9xTow+64hP2gMrqPSBzyxvBp3otOj/WHiDHi
         4Ia+6LjdkpiUWeb0w7Oo9LfAr8wc1As91TACspUjkTSHK6bTsUChSGHI3010dOgc4b7R
         a89Swjut1mWc15+suVCfgHeUaiwm07EJrGoqtSnzb3dTs+u3yHun2/rVNT+XdgxokUJD
         gOI6aYsRe05qB6SGuVEouRR2FavumeRo5oe5gT1TtQ0Cl2tpEhABGpuS4w94GTJBCtGA
         7e6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ED1AAx7D9NK7Wk5Py1tyBK/k8a9KqL+1lZTZIKRmUmzHUV+HZ+mexMUJ/8XRHnOMSC+BQ/lU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1jkozsRfURnSMFO8jWV8jini8Kg26zUsnbAWxydV4jcaZrbPT
	fjiYgM+IXRJgqpwdt29OMUfbMnWp7vstRmqEM0iMam4tVxyBYEysAEeZmJo/bW7yAGMgaisk1Rm
	Z0/m479mU/mXEcyPfv4/bgndGTItu0cUfsGSdfeEXrV1zAhTqpSF141oyLPCovAqs
X-Gm-Gg: Acq92OFH2yYrqctjW4CUd4mOU9yNP87phuSDSz7sMQPY3Xu/xmpU+N1QUC1oRZzU2Lu
	zJ5Mmy9jZ74hyvcxh8kNXBDBlOr25MnKzklNQSCM1WM5HPilgUzZG6+wcTzfTyV8zfU2w/DIzRM
	etTWDp7RlxLdFAzLiHft20ndjyYKmrCqv6sZS7M83MinFlk67qkX6Ar4wU3VbfmF54p/6E6164H
	9w23kaZ9HGEQlckZEseYFweWwYZSVNbNY2bf26F7//TUwNqhSasYANJaTI+SjCqq6/jaqU91DXC
	aCFwaXsCCDVmMubRJg7yCxYe9zDrHQLX6itNf+PgWKctMnRB4keTlDCMl0Vor8ThYLiuHbb2M64
	nv9hIWG6wqdfmiXXRZzJusrAywgrxxijhGRlVp09PIUdljiwcGWavFuVA8W6qErwXTce4
X-Received: by 2002:a05:693c:37c3:b0:304:de94:1c55 with SMTP id 5a478bee46e88-3077b38e7e4mr14417789eec.35.1781015858618;
        Tue, 09 Jun 2026 07:37:38 -0700 (PDT)
X-Received: by 2002:a05:693c:37c3:b0:304:de94:1c55 with SMTP id 5a478bee46e88-3077b38e7e4mr14417728eec.35.1781015857847;
        Tue, 09 Jun 2026 07:37:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm26513545eec.8.2026.06.09.07.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:37:37 -0700 (PDT)
Message-ID: <a90fba3c-c4c1-470f-b5fa-5cf1fee17163@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 07:37:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260609
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a282533 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Of_zAPQQtSp_xK_LWJsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: W7sPnLQQ6FetCNrnwBUp9DZ4TNnT1fXV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzOSBTYWx0ZWRfXyoXKA0zew0tb
 lRqaO0dfMLqhCHknrnzslUsimXi+3t7mnGG1fzG/t1p2MXt9apdcbeaN08HzurNzlhEIdFcLrkP
 p83fazrQJIt4RFesdNYpvmL1hckjvwa//IXWmr6HLAJcku1/Dj/CcGgr5NUFXXPGgglCCc/0Mhb
 UnIFnZCb1o+vcRdWk5h8n62s8GWVdnYXAll2gSbjdf9HcMrxQS8y2dUGFF5aKOtxLY3Xn+xFchI
 N2uk2bmf0f37VXuoVmivizpf125dXVNTQNoAAxhEt7MsQvMpuTZEazMBFq+YsK8zFrnUMRpC+k3
 nzqVmSUK+LsrfwH6OOud789uCNcS+G0/nG3IHIxfU9brwikkO9qXZpHsC0AbNTUXB77Nh8bBd4J
 cCX+O1txdR/6LH1u81VE4j6LP/NbFn/zgkrpUe0PyxjKNXV84ROs/IJgbX7Ex9PPzDhjB6sdJ9Q
 woOCZtm1Mm5zEFdqKaQ==
X-Proofpoint-ORIG-GUID: W7sPnLQQ6FetCNrnwBUp9DZ4TNnT1fXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073741_133821_872B297E 
X-CRM114-Status: UNSURE (   8.91  )
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

The following changes since commit a26c2a22e7e88b2b5afb1349f3994fc564c988b1:

  Merge tag 'iwlwifi-next-2026-06-03' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2026-06-04 13:22:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260609

for you to fetch changes up to 63abe299b12b317dfee5bcd09037da4668a4431a:

  wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported (2026-06-09 06:50:29 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #4)

An assortment of cleanups and minor bug fixes across wcn36xx, ath9k,
ath10k, ath11k, and ath12k.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix EAPOL TX failure caused by stale tcl_metadata bits

Jeff Johnson (4):
      wifi: ath12k: Update Qualcomm copyrights
      wifi: ath11k: Update Qualcomm copyrights
      wifi: ath10k: Update Qualcomm copyrights
      wifi: ath: Update copyright in testmode_i.h

Rosen Penev (6):
      wifi: wcn36xx: allocate chan_surveys with main struct
      wifi: ath9k_htc: use module_usb_driver
      wifi: ath9k: Clear DMA descriptors without memset
      wifi: ath9k: remove TX99 power array zero init
      wifi: ath9k: remove disabling of bands
      wifi: ath9k_htc: allocate tx_buf and buf together

Stepan Ionichev (1):
      wifi: wcn36xx: fix spelling mistakes in dxe header comment

Tristan Madani (3):
      wifi: wcn36xx: fix heap overflow from oversized firmware HAL response
      wifi: wcn36xx: fix OOB read from firmware count in PRINT_REG_INFO indication
      wifi: wcn36xx: fix OOB read from short trigger BA firmware response

Wen Gong (1):
      wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported

 drivers/net/wireless/ath/ath10k/bmi.c              |  1 -
 drivers/net/wireless/ath/ath10k/ce.c               |  1 -
 drivers/net/wireless/ath/ath10k/coredump.c         |  1 -
 drivers/net/wireless/ath/ath10k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath10k/debug.c            |  1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c      |  1 -
 drivers/net/wireless/ath/ath10k/htc.c              |  1 -
 drivers/net/wireless/ath/ath10k/htt.c              |  2 +-
 drivers/net/wireless/ath/ath10k/htt.h              |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c           |  1 -
 drivers/net/wireless/ath/ath10k/hw.c               |  2 +-
 drivers/net/wireless/ath/ath10k/hw.h               |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  1 -
 drivers/net/wireless/ath/ath10k/pci.h              |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c     |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |  2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h          |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath10k/usb.h              |  2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h          |  2 +-
 drivers/net/wireless/ath/ath10k/wow.c              |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.h              |  2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  1 -
 drivers/net/wireless/ath/ath11k/ce.h               |  2 +-
 drivers/net/wireless/ath/ath11k/coredump.c         |  1 -
 drivers/net/wireless/ath/ath11k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath11k/debug.c            |  1 -
 drivers/net/wireless/ath/ath11k/debugfs.c          |  1 -
 drivers/net/wireless/ath/ath11k/debugfs.h          |  2 +-
 .../net/wireless/ath/ath11k/debugfs_htt_stats.c    |  1 -
 .../net/wireless/ath/ath11k/debugfs_htt_stats.h    |  2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.h      |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  1 -
 drivers/net/wireless/ath/ath11k/dp.h               |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h            |  2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c            |  1 -
 drivers/net/wireless/ath/ath11k/dp_tx.h            |  2 +-
 drivers/net/wireless/ath/ath11k/fw.c               |  1 -
 drivers/net/wireless/ath/ath11k/fw.h               |  2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h         |  2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h           |  2 +-
 drivers/net/wireless/ath/ath11k/hif.h              |  2 +-
 drivers/net/wireless/ath/ath11k/htc.c              |  2 +-
 drivers/net/wireless/ath/ath11k/htc.h              |  2 +-
 drivers/net/wireless/ath/ath11k/hw.c               |  2 +-
 drivers/net/wireless/ath/ath11k/mac.h              |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.h              |  2 +-
 drivers/net/wireless/ath/ath11k/p2p.c              |  2 +-
 drivers/net/wireless/ath/ath11k/p2p.h              |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c             |  1 -
 drivers/net/wireless/ath/ath11k/pcic.h             |  2 +-
 drivers/net/wireless/ath/ath11k/peer.c             |  2 +-
 drivers/net/wireless/ath/ath11k/peer.h             |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |  2 +-
 drivers/net/wireless/ath/ath11k/reg.h              |  2 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h          |  2 +-
 drivers/net/wireless/ath/ath11k/spectral.c         |  1 -
 drivers/net/wireless/ath/ath11k/spectral.h         |  2 +-
 drivers/net/wireless/ath/ath11k/testmode.c         |  2 +-
 drivers/net/wireless/ath/ath11k/testmode.h         |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.h          |  2 +-
 drivers/net/wireless/ath/ath11k/trace.h            |  2 +-
 drivers/net/wireless/ath/ath11k/wow.c              |  2 +-
 drivers/net/wireless/ath/ath11k/wow.h              |  2 +-
 drivers/net/wireless/ath/ath12k/acpi.c             |  2 +-
 drivers/net/wireless/ath/ath12k/acpi.h             |  2 +-
 drivers/net/wireless/ath/ath12k/coredump.c         |  2 +-
 drivers/net/wireless/ath/ath12k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath12k/dbring.h           |  2 +-
 drivers/net/wireless/ath/ath12k/debug.h            |  2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h          |  2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h      |  2 +-
 drivers/net/wireless/ath/ath12k/dp.c               | 10 ++++-----
 drivers/net/wireless/ath/ath12k/hif.h              |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  4 ++++
 drivers/net/wireless/ath/ath12k/p2p.c              |  1 -
 drivers/net/wireless/ath/ath12k/p2p.h              |  2 +-
 drivers/net/wireless/ath/ath12k/reg.c              |  2 +-
 drivers/net/wireless/ath/ath12k/reg.h              |  2 +-
 drivers/net/wireless/ath/ath12k/testmode.h         |  2 +-
 drivers/net/wireless/ath/ath12k/trace.c            |  2 +-
 drivers/net/wireless/ath/ath12k/trace.h            |  2 +-
 drivers/net/wireless/ath/ath12k/wow.h              |  2 +-
 drivers/net/wireless/ath/ath9k/ar9002_mac.c        | 15 +++++++++++++-
 drivers/net/wireless/ath/ath9k/ar9003_mac.c        | 23 +++++++++++++++++----
 drivers/net/wireless/ath/ath9k/ar9003_phy.c        |  4 ++--
 drivers/net/wireless/ath/ath9k/hif_usb.c           | 24 +++-------------------
 drivers/net/wireless/ath/ath9k/hif_usb.h           |  4 +---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c      | 18 ----------------
 drivers/net/wireless/ath/ath9k/hw.c                | 16 ++++-----------
 drivers/net/wireless/ath/ath9k/hw.h                |  2 --
 drivers/net/wireless/ath/testmode_i.h              |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  4 ++--
 drivers/net/wireless/ath/wcn36xx/main.c            | 13 ++----------
 drivers/net/wireless/ath/wcn36xx/smd.c             | 13 ++++++++++++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h         |  2 +-
 103 files changed, 139 insertions(+), 171 deletions(-)


Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00EDC71157
	for <ath11k@archiver.kernel.org>; Wed, 18 Jun 2025 00:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=; b=ADpgP+KZOTKOD5ZT9J04yikBrB
	tAeBp9rBo4XzwNmXNQ6JsPXUTdoLQtadO2VHkUYNSTKQTka3O2Y4angrF11STIpmUDDkL1vMgjgCd
	ZkA572amRTqj7HRzlL73cMzGmHJzEMisKPbGdgtJoWqVwIJ7BWyMtIUL7h4sv+2njAc0YKGmLjeMJ
	cb7HYTrQx/zgc5EphMNwL2hLrdHd76naTj9rXZZSpQoxPM5lnIUDYOF3D5PiXL0CeTxS8iydZ3vWY
	Z9s2cUjguIJd+Z4kmYu7yY8CCClUjbTBxKah9i4/Am9DVw4PHmPhtFvFnIxdVsP7F6B6s593YiGzf
	2VssW8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgee-00000008gED-09fu;
	Wed, 18 Jun 2025 00:27:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRgeb-00000008gCw-1Izz
	for ath11k@lists.infradead.org;
	Wed, 18 Jun 2025 00:27:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HFd4xs029414
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M0UFGlCDLAmGlSRbv4ia+Y
	pJ/DiudoV1d7kt9nUTgaY=; b=nGL1kajB0G5RdQgvMHvzMqr0claUc2qMgsKbOf
	eQ4OHmPb+0oCL57L87CZqI2/rLlM//p/OZbv8m9fp7gqyJJGfb5BRjA1/udsrlb+
	2AaOo2LkAFI2fWVEQMqC+K4CZ003hf3rsj6+KpWYyZ7nqBRr9gs7HtmnZp1aQ8BB
	/v7myCAft8EAud0iOd3/HaEhAiWcVxp683bJJ7OyjM+tmYqKyqMwzGctlDS6eo8p
	ktWNcnLoGwE7NDHOi+J8jCiw690mTjG7w2CEn+CjRdyx1TlstRZDJHh6YBGiJQup
	tYszus5Ni/hQgOTUAN8gCcGJ6bu6KDPhTpwd0YiFQ4ugQeyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mj4xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 00:27:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so3987690a12.2
        for <ath11k@lists.infradead.org>; Tue, 17 Jun 2025 17:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750206468; x=1750811268;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M0UFGlCDLAmGlSRbv4ia+YpJ/DiudoV1d7kt9nUTgaY=;
        b=FXiXGykbQdFdSguwkFUfqdy7oqfa+BZ8+FZcqcYvxqV5A6DAjY73Wpv4nI600/TeAO
         pQBwwXe+fjHdFOVgsgjKezjeuuGntQZW23wJLbtGDTL40d3XIIkMbmzl1mKY3TgsNPzX
         3rBFot3a+PYxXFGEDDFW9ic3qOoY5kR6LnmGNbD7VkXQ3QFu0l0QfvTxuyQlvjQ9NNX5
         Jfqr3EQgaio5yj9GSU25bpwLyIb0bVVN5aCnomYkbleTL4YkIF3Owyid8gDYyLVR8bTA
         zRczf00jIOPW9WJRamjwi5Xvsrv6WMS4HHcO5+79JnXUv7AIpelQOkqTBvA0TtN/Kn3H
         uWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhnoT5BoNZv+tY+Wmteyz6EC1FwXdthrPxHliRX9HvmSWN2zaSnh/Xm4DahQp2TMvO3FOhG6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG6hQCnD/GG5ZDyalT3Aq3k+J9+r4LxFwXNO5iFRILPM1PLnAv
	br6ijtbCsiChWzIlf9lKFhQqZaiwzfz4+4O3FfPFPphqw/gNVYGHDS5nMdzQkY2cwrkOLZ3xdps
	WhpEca/urNBgzrpIjlezmIE8wT5kaY59qHw1hHVSBEfa4zcIRmdtmn0N634aOiyOFqpj/kPn3
X-Gm-Gg: ASbGncsZn0lZnyhEjYDeQVJOQBtcZ+CzpfLHfg4q2/MPNx6ZKlqp4UdEryFk5GkG1RM
	Ui0uH2N7ePC982Tn+iNovDM5oTIapthnWhBY+iVURST55kFZpCzrMSd03/kI3DkZfCTh3aa2FXq
	CAzUiSILpwmW0KsnXg6JNRM4egNKVMSBz4DunBC1RHjrqHsFpsVcaTQ1filEVBJqgc2sQyV2zZ3
	sEDaxHr4dfXMO7EoysaqGnHjtsGMktsGTEnGiKd1w4XDUTSjL0IAPwxtUIoRzs+OO3JXT0qjoBA
	8n9Qk6JJQvuJuxBB1nWRvie2vk31U/kw1yrp1Oqn90zTGOcYECMSVxFauJs=
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328147a91.2.1750206467649;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE47uJ5OhWhcQUshu3iRdTlSHkJeUqFGAtI4R66G6CQxenFgnSEHCf6F2kwyiWPrYnb7iu/3g==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr23328110a91.2.1750206467179;
        Tue, 17 Jun 2025 17:27:47 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49834sm11294893a91.27.2025.06.17.17.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 17:27:46 -0700 (PDT)
Message-ID: <9fb699ae-3f30-4459-94e5-2f7bdb29177b@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 17:27:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250617
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAwMiBTYWx0ZWRfX6pSjsRTvRLG/
 fuHE55DOmBNT1vfuIgqHEOjsC6tzGnXhYcXYSiAcmtUWORSfPgIWXlNk8lFPKe9f9eZDWYSgtQ2
 bJzV2CeKd38Q+AoW7Zd/QuP2y+XHDR5PtujxMu86xgCLnhwaxqfNGBlDP2mmuAOvCvcoKRgyII/
 iq1W/vUNoMcgNzw3Yv0MkapU6WnyYt4QY1e90VBV+OeWj5NdlDbesTHmaKeEhNUBqyedu8AYDwY
 Sp5IhFyWmLf4rpd/y5Fo1FqKtnVorvw0dOlr+Ot1QLP89ejHX9ERO+89i7QHxMBYWQLUm9oVbzq
 miPacLXc+qYUO+QAuUBzJPFCCqUeancULSujo3SzEKi9zAdeZxmzMeHvs3CgptaAHU3j4LmUBTI
 w/fOd05OufLJd71Td8IbfuFSgM0daA3XWNS8XqyXOgvx19JASHYmHQ2bHIiHtCiGaMyhZxXM
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=68520804 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=v6iAXbONLxioC5Ttwi8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: hS-cpXFqxl02LGXZnqvj7ipqotdsoYtL
X-Proofpoint-ORIG-GUID: hS-cpXFqxl02LGXZnqvj7ipqotdsoYtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_172749_353349_E079DB6C 
X-CRM114-Status: GOOD (  11.54  )
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

The following changes since commit 27605c8c0f69e319df156b471974e4e223035378:

  Merge tag 'net-6.16-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-06-12 09:50:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250617

for you to fetch changes up to 15d25307692312cec4b57052da73387f91a2e870:

  wifi: carl9170: do not ping device which has failed to load firmware (2025-06-17 16:28:35 -0700)

----------------------------------------------------------------
ath.git updates for v6.16-rc3

Fix the following 3 issues:

wifi: ath12k: avoid burning CPU while waiting for firmware stats
wifi: ath12k: don't activate more links than firmware supports
wifi: carl9170: do not ping device which has failed to load firmware

----------------------------------------------------------------
Baochen Qiang (10):
      wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
      wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
      wifi: ath12k: update freq range for each hardware mode
      wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      wifi: ath12k: update link active in case two links fall on the same MAC
      wifi: ath12k: don't activate more links than firmware supports
      wifi: ath12k: fix documentation on firmware stats
      wifi: ath12k: avoid burning CPU while waiting for firmware stats
      wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      wifi: ath12k: don't wait when there is no vdev started

Bjorn Andersson (1):
      wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT

Dmitry Antipov (1):
      wifi: carl9170: do not ping device which has failed to load firmware

 drivers/net/wireless/ath/ath12k/core.c    |   4 +-
 drivers/net/wireless/ath/ath12k/core.h    |  10 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |  58 ---
 drivers/net/wireless/ath/ath12k/debugfs.h |   7 -
 drivers/net/wireless/ath/ath12k/mac.c     | 394 +++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 829 +++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h     | 180 ++++++-
 drivers/net/wireless/ath/carl9170/usb.c   |  19 +-
 9 files changed, 1395 insertions(+), 108 deletions(-)


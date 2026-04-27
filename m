Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4B2FF8869
	for <ath11k@archiver.kernel.org>; Mon, 27 Apr 2026 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=; b=IxCdQ/fOzsaQQShW7DgthdYK6u
	DGegxhZ3M4Ytd5AVHrPF16qw28THQqy8Y19TIDJhb9rfUYXxmj8RoyKU+k8ullthBUePDekutAccp
	mtwzcnhj+XM1393BtLGXPKBMvKILAKCnnUW3pRzZeA3ul04WD2EFkQfu1Ai3+0UZ84C7pZwCSDmtY
	bu8WPremF8gkBOj8vBmCxTbHvaSvR55EzUuIGN2YaPQoYRq31VshOiX3Hucbg+iP4C3k9qe5iiDFu
	vXRbH9eOZ+u84EkmaLMkRGZlPKbPTav1riLrYAD8/8QI4K3NtiImrnJSZwx0myIEImfvYRMc4RGqg
	9s8UnA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMgh-0000000H3uC-25Ql;
	Mon, 27 Apr 2026 14:11:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMge-0000000H3t8-1xih
	for ath11k@lists.infradead.org;
	Mon, 27 Apr 2026 14:11:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Od5v3825224
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aA8A2beOZ7PaJPh6gnoKuM
	WPVYV/5052moWZbH5LvRY=; b=pkwAw36Ho2+iE5B1Mzt8kXgT4DwZSZRo79Z+iX
	fXA9DJwzshq72ja/tCdp9dGo0QjhlPT+Oz0qRU5MsFAzIej1pb7D4rsolCheoKKH
	5v2napDN4XugCYzfh+BJc8OcPYWJCtwKYK+7iQzzsQ7C5tU2MgwvM3Df6T3ts4F4
	8NknCQnVJyLtbcEHEx+1/JZ9CVU7rsE/nI2jTUlw6ZMOqPvTrdg0jGM+lP2OHVlc
	EzNWIiBuc4Cm7uZ6/k/vG8XC3pxeUwrUW0o41junreK+EB98SJkF+hQ1d5QgMaf8
	DYnquS8MD9ta6NKbfGaIvYcahGsX3jmeVqNErWZ+R/SEIfsg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt55512rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:11:47 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c91ef7009so29181009c88.1
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299107; x=1777903907; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=e8Rfm5I+0Yn/rEan14wsDKBp1SBtgWwHOAv5i7+577ZMz30y24KZqToIsDqqOU30nB
         95o4F0PSyZMIegKjFjLRYmyo0vWDovQ+2yhC1X+pgpxSeayE4XHw4zZJGkzz9USfj9ma
         4XuPvkyM8T8UnO1y4Nzkpq83o92mNkkOBxvHV1wDrxTx2T2jGue7WhHmgW+G3l9w6Yjr
         tFZtwPNE0fgJ9cipYgZsVViN7Gbr8yT9c6eowP0tONm4Ol3EPJEyduRLxkQBJvFC+5W+
         SJBb+LOKZEWW7rLpGJzoVZIYES6Lx01xPNpSvfLn/JiMV3nISnwAlhwCX0v4idjWnKJ/
         OVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299107; x=1777903907;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aA8A2beOZ7PaJPh6gnoKuMWPVYV/5052moWZbH5LvRY=;
        b=kO99FWN9PCmAJqOLBPRwSWaRK+3ntkpF6kp9/K6PvBPR8Rh22qpJtBVbp1dm2L2jsV
         oOQ93tusoIqGp9QCvy+HLwKqJ9UFFscaWSEvDQ1GPIh6U5YwFKTjZbAAC73vjiilx/+3
         uObOxoWLOHInDf+K4dwBb/PTM28UDSGkgEW0PGezRNoCXlrkTKr5A656zQTHpVQXKLxt
         trw0aMEUBVOyuUBAAMTL2Fi+TCPeqC9c4/LyJfzrMnTWNGzuvzoq4uALQeSxK4/YrAKz
         yNFmEDtzoAsYYj0Zehu3dPoDJKVnbbFxTJcidrlaIfUliqmX/MLpmE+x1t5cpW0NaDFc
         kiZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AZU5cImAfPzOpOVRQh3DDRgiH1xpusHOwYp1tSPfSn0pgLqmbe0WwEDAos0x8W0EI/AM0ziY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4E7ZiDj8w6DnnIqDkxjgJoGEgcz/zvVVcnrFb+K6xIODXE1nc
	VO5J9wP1rSB++lRQyiRPlWENoSQ+JcMH5pFmTBGPRgIpkwt38+XAHmt6r0fS9cjKGbK1ApB36fA
	fWfadGWur8CaymO6dvzHyHURZjYNUjQk2rDToKA3pjsD32Z5mcXx3Od4ZLFZu3cTA
X-Gm-Gg: AeBDieuCY4zTY0d3ehWlctVjiuBQA1tb06vghQPQFF9bWu2jmZds3Cuw5+OqGcYZ5x4
	eTHrxrxwFU/DdJYfqFTNK+QHRdhh2NP95N99i0E9KVjdxgd+aDxc4anp8rEDXQ04hFQYYPsKja6
	efNDOO+WIubqdKmu80rQLHJq3N1qZgyzQEyctRcXXUsjo34UJayvD3Tt0xtiuGvQ7VBzQ8Q8nFI
	5Fcg+u2fDCojGZT5z/ZwbJGJGXjahZdIbyvuvTDtLloUzzR/tsZdlj/jtxE/WW/XKqJapazQMTC
	edMM8RdtpJ6FMKvDv/HyME5HISoNnmvBElabOMxRcdK1oET9fgU6ACwrSyHfqm3f6+mt9P5OE9e
	Si2l65Zk0XtqsDWeSge4fBurYH44vwEJMi6zLCvwB8e587qiA86xBV3kcVllCIqDj0Yb9
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542072c88.29.1777299106972;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
X-Received: by 2002:a05:7022:f016:b0:11a:641f:ba11 with SMTP id a92af1059eb24-12c73fad616mr23542050c88.29.1777299106265;
        Mon, 27 Apr 2026 07:11:46 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm67154071c88.10.2026.04.27.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:11:45 -0700 (PDT)
Message-ID: <b1071639-e724-45f4-a1f0-51706acb7ccf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iMZgVkuYZbzYMlqMrodm9PGqNlfcLYYn
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef6ea3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=m6NHjSuB-jaKV5Aw_IsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MCBTYWx0ZWRfX0v57DeTYVqmY
 dl8FreU9ZRFNPaYeCYs+cId9Zt662h6eEmf/Vkop2TiHbxqFp4deYOIjjrwbM1v/iPWoYDXVr9y
 uW/djY14vk3OmSDJlTVan427M0liZqSf5oQspYefpY7p3HSZkjHpv6mI59lakDRNUCb2V94JTl/
 pIfeIKuehWV28cs9bZ7WLbQAExoJGfDddEiY67Ofd0ZoajgkhUor0S92rJX0W/I/WUb+aORzz6K
 TRGID9VfoONq08FKriXrdfphbbPj/X7AOwD4WGPm7iEZJW6ze2VE8+9XQqzRthpwyWdXbC2IQaM
 HrH3djyTKGefh+ml13XmwOwGjO1cNqRnF2cLESlaokoVWyZgiXBOjouxpobMWHuMSi1HuNfj4cN
 FlRdUOaEGQHOQf5jrRPRJwnJQyqKel25Hv9K2HCFIOhBOKIFZwI6/Y5CrJAVKAqKPhU84I7tEe+
 ig7iYKlJBv9YwCf02KQ==
X-Proofpoint-ORIG-GUID: iMZgVkuYZbzYMlqMrodm9PGqNlfcLYYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_071148_516321_CD87CE19 
X-CRM114-Status: UNSURE (   9.01  )
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

The following changes since commit 929298742bb5dfacd53ea99cf989cc81210f90a3:

  Merge tag 'ath-next-20260408' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2026-04-08 23:26:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260427

for you to fetch changes up to 34a5329beee86a22a446e27eb37f06caa63479ca:

  wifi: ath9k: Obtain system GPIOS from descriptors (2026-04-22 06:57:12 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #1)

For ath9k:
- improve the GPIO interface.

For ath12k:
- replace dynamic memory allocation in WMI rx path
- avoid buffer overread when configuring IRQs
- code housekeeping

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: Fix invalid IRQ requests during AHB probe

Jeff Johnson (3):
      wifi: ath12k: Fix HTC prototype ath12k_base parameters
      wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature
      wifi: ath12k: Remove macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS

Linus Walleij (1):
      wifi: ath9k: Obtain system GPIOS from descriptors

Nicolas Escande (1):
      wifi: ath12k: avoid dynamic alloc when parsing wmi tb

 drivers/gpio/gpio-ath79.c                      |  57 ++++++-
 drivers/net/wireless/ath/ath12k/ahb.c          |  25 +--
 drivers/net/wireless/ath/ath12k/core.c         |   6 +
 drivers/net/wireless/ath/ath12k/dp_htt.c       |   2 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h       |   2 +-
 drivers/net/wireless/ath/ath12k/htc.h          |   8 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h |   1 -
 drivers/net/wireless/ath/ath12k/wmi.c          | 217 +++++++++----------------
 drivers/net/wireless/ath/ath12k/wmi.h          |   3 +
 drivers/net/wireless/ath/ath9k/hw.c            |  33 ++--
 drivers/net/wireless/ath/ath9k/hw.h            |   3 +-
 11 files changed, 188 insertions(+), 169 deletions(-)


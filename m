Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DD4C47DAF
	for <ath11k@archiver.kernel.org>; Thu, 18 Jan 2024 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DwlIkgr+mMtYRYcKpMYDmP4lRRqe0Ko7EaCuNkzo4Q=; b=CgSbF/t05jiqpvMkv8IjDQFNNY
	EJOBAuGVQHbWcwfAJQWlnMthY69UiddFClFvMjEmHXbi1gQF9DycA70YT6FwzMiHDhMDhMK/9AV7P
	691HraIeN/nuImTt1bYaQK3rgR+jvUvPScr+eepz2yy67yf2TuKoTrua1ZtbiFifAGCq+cplcd7q3
	OtqzuxGJO1htgMA3ah25FJE9FmaYfdZP8S6eemPv0GCfjKGSzv0z/pN4yjch303zGes1HTQZHuXyG
	/jBZ+nZCnbZOKaDqdJPZV2hf9wthM209otyQSX4bMdHNOry/EovJ8rwnWzeBMx0hSuuACqpto4Gae
	lVA1bcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQQGj-002SMB-1P;
	Thu, 18 Jan 2024 11:09:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQQGf-002SJQ-0q
	for ath11k@lists.infradead.org;
	Thu, 18 Jan 2024 11:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B92F602E0;
	Thu, 18 Jan 2024 11:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C51C433F1;
	Thu, 18 Jan 2024 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705576114;
	bh=rGbrI8sNR96Acbsy9tBWyCiVY3Sa9RJ0zm5JcTqANrE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FVq4UqzRz3KJliesJ/BdCC3eGm/OBDDeBB3uv+HhnSIqLhnBr7/eQvQ0jBozxLtpu
	 U6536KA0mxD/9x66U7v43Rn0CaLV6f5R87dQgciFJs4y6heCyH0s8Me4aE6n3s1PFL
	 4n9W6HFv0YjbE/nwWIcr9C7MPKK4tAcOJ+2St+hWdnJccAtPdlTiGtEuSClpbDHMaj
	 z4TepxfgrrXmvknY5qXn0p9puoJvxxKrU3qgL46W9s39AjDNvsiNCasO2vIwboI8q2
	 Guvaj5GWfNTh6QL/QV6pblEpBRY+nOR7D9MbJDo/mebTWcJYSqZcHgczeKMUoOwE6F
	 Etuudmr27d+ow==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
References: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
	<874jfg7xm4.fsf@kernel.org>
	<b4f29511-e001-4964-b88d-208dabf88121@quicinc.com>
Date: Thu, 18 Jan 2024 13:08:31 +0200
In-Reply-To: <b4f29511-e001-4964-b88d-208dabf88121@quicinc.com> (Jeff
	Johnson's message of "Tue, 16 Jan 2024 08:58:04 -0800")
Message-ID: <875xzq526o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_030905_415730_DAD2147B 
X-CRM114-Status: GOOD (  19.89  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/14/2024 7:17 AM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>> Commit 7636c9a6e7d7 ("wifi: ath11k: Add multi TX ring support for WCN6750")
>>> added HAL_RX_BUF_RBM_SW4_BM to enum hal_rx_buf_return_buf_manager. However,
>>> as flagged by the kernel-doc script, the documentation was not updated:
>>>
>>> drivers/net/wireless/ath/ath11k/hal.h:689: warning: Enum value
>>> 'HAL_RX_BUF_RBM_SW4_BM' not described in enum
>>> 'hal_rx_buf_return_buf_manager'
>>>
>>> So update the documentation. No functional changes, compile tested only.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> 
>> I'm not really a fan of kernel-doc in wireless drivers, it feels more
>> unnecessary work. Should we remove the kernel-doc markings from ath11k
>> altogether?
>
> Are you not a fan of kernel-doc format specifically, or not a fan of
> documentation at all?

I'm definitely a fan of documentation where it makes sense, but I'm not
fan of kernel-doc if there are no users or readers. For example, using
kernel-doc in cfg80211 or mac80211 makes a lot of sense, and is
important, but I'm not convinced about using kernel-doc in wireless
drivers.

> I'm personally a fan of documentation since good documentation makes the
> code more maintainable. Yes, there is a cost in creating and maintaining
> the documentation, but this is hopefully offset by cost saving when new
> developers are trying to understand and modify the code.
>
> I'm also a fan of consistency. And since kernel-doc is the standard
> format defined for the kernel, it is my personal preference to use that
> format.

I understand your points and if we had plenty of free time I would be
onboard with this. To keep my mail short few quick points:

* To make sure there are no kernel-doc warnings we would have to add
  checks to ath11k-check, which would slow down it considerably and it
  would again slow down our workflow (I run it several times a day).

* To use kernel-doc formatting alone doesn't really make sense so we
  would have to start creating a kernel-doc book or something. But who
  would read it?

* kernel-doc moves field documentation in structures away from the
  actual fields which I find confusing.

* The risk of having outdated kernel-doc documentation is high, it would
  need active maintenance etc.

* I'm worried about creating useless documentation, like "Count number
  foo" for foo_count() just because of kernel-doc.

This is why I consider return on investment is low here :) My preference
is to make the code understandable (good symbol names etc) and document
the special cases, which are not obvious from the code, with a normal
code comment.

> I'm curious what others think of the ath10/11/12k level and style of
> documentation.

IIRC iwlwifi uses kernel-doc to document the firmware interface, not
sure how much it's used elsewhere in the driver.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


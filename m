Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25600CDB465
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/tEXnZLX32hsOAyj21ICOKafpESvFi/3GdT1aXCYxU=; b=D9rTzC/35IXZ7S
	NVBW9d+yRO7Ghiyo+wjjimL5Uc03c6aZV0GexodQj9GACogkGjXHrUZZgxH5rZEi3FWISicjyWzmO
	LqKDA0V0uZdlLlCp6YFPXidLwAZ+tWotZ7Xg7ByEKJZM4I8+2vJNDd6M02NFtEUPxpAh6cG7unUnO
	BTxYqsCdMuMojw/4sNSjrxUdb5wYn4kJtc24fT/E2WPuub6BWRdWoT33q2EHsuTP9r/8/7AZoN73C
	Qqcu5olnF49oGNsoCHqZixZ2EuQnNi9aN1A4uLPxnxMMf8At8Sl4Uxm3QYwBPwaPhNKuqHMmLMqF2
	o14vYPriNqHMbxTIfxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPiq-00GstR-0i;
	Thu, 19 Oct 2023 09:53:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPim-00Gst2-0T
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 09:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7011561B0C;
	Thu, 19 Oct 2023 09:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F408C433C7;
	Thu, 19 Oct 2023 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697709219;
	bh=WuLlGEqjoehEfby0RKfxXzF4AUhxhkyRp8krWGQEpZw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=s/uuqQTKKeHSMWcRTOKEW+/NOuualBhDX/EUDLCUVsgLv/q5krD3HNZh6VGksGylO
	 /Np7pFuyBI/6ReQXP+5LI0VGc6hHWyVCJ3ak2vVKNx3PI3iMf78CT27i+ZPMFmzYXm
	 irFSN8VX6zHM85Y31JoWew53VvB+ODxvIc9qqoce4EgMrS3wftGkTI6weF0kkE8xnv
	 Wc4sBDBOrGPeaWywc/fF+0u++Fgg1lXHQm+5PpSKHGNQ2NPGEAUg1jvClUO3EauWUr
	 UMQvuegGf8s5NY4UTC/B7Gmep5vNROb9zwXNmPal6uQ8uV2c8zIN8WGphxVKMqAyJr
	 x6Fe5kyCH+2Ag==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <mhi@lists.linux.dev>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] wifi: ath11k: qmi: refactor ath11k_qmi_m3_load()
References: <20230727100430.3603551-1-kvalo@kernel.org>
	<20230727100430.3603551-3-kvalo@kernel.org>
	<d86d8f47-dbb2-1da6-794a-c020c317b4b5@quicinc.com>
Date: Thu, 19 Oct 2023 12:53:36 +0300
In-Reply-To: <d86d8f47-dbb2-1da6-794a-c020c317b4b5@quicinc.com> (Jeff
	Johnson's message of "Thu, 27 Jul 2023 09:47:21 -0700")
Message-ID: <87ttqn0wgv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_025340_225509_24CEDC59 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/27/2023 3:04 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> Simple refactoring to make it easier to add firmware-2.bin support
>> in the
>> following patch.
>> Earlier ath11k_qmi_m3_load() supported changing m3.bin contents
>> while ath11k is
>> running. But that's not going to actually work, m3.bin is supposed to the be
>
> nit: s/to the be/to be the/

Fixed in the pending branch, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

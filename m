Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0518CD1299
	for <ath11k@archiver.kernel.org>; Tue,  9 Apr 2024 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA6Wqvp15NV650keqaASqo9A5CDJlkXx1av6aZaxks4=; b=OlUoJuj58GD2lYggp6NODA5S1r
	VRhO8/Lzt/hE4SDMOJE0XEEgQ1NaxPsmG8NrkrmYbdKbAj6ZkQxovNkR+/75/+W2tU8GwY1bwfQ0r
	bcd5cM591R14FYhf7QSnbKxF2bjfzc74ZOPQRF/cNDeV2JKSfgL1OA8wv4trgxW8Pp826Snro5lNz
	VJXQj3fNyRLud+69WfSaZwYj18K9ac+E7X91PrYxoSwbB7CK/gjy3DfpguTwigbMeKlhUWp+N9fXC
	S4NGQbv+J8xO43oxV45QD6mhc1tTtjia0UMbCtpLEctNcER8/ifOjr54eneZbbJyAclVmmviKJ8Ob
	ZQhOWCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru7np-00000001DbL-03hR;
	Tue, 09 Apr 2024 09:30:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru7nl-00000001DaP-1Wsh
	for ath11k@lists.infradead.org;
	Tue, 09 Apr 2024 09:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97B91614AB;
	Tue,  9 Apr 2024 09:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E850DC433F1;
	Tue,  9 Apr 2024 09:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712654999;
	bh=VxGe2y2hTT/OKqj/iuGp7AuAf+llkMhGqGe3IdyOeRU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S7Fy2HCguTBT9VYHJZclIYbNIIKYyjGS4SJ6JNEwheRqDkW8jfuBojcHs5bYHEfQ1
	 +pJCicyv9U3TRrhFv8uSfPDBhs90GB7CwzWYY8ojXd5Fh79vzTbZUMBAH5VUIr51dP
	 1rr/V69bZgCBGlKNxH7zw1DI/1WZgRsv3/xFWVAqfk5oVqt6qPVd9TnwpRt+9OCIOy
	 5v79PvNGYxcVicC0wpkpRecp3upICbOWfUQZHEQ/RMFzydcBr2RkDeZfOZ4AzrbsuB
	 8zCxyqoVo9bCM2CCZKLvwrq/qpDUkSRNoVkw7Y5oBA1MeaxzNjcPJS5AedbUMKorq2
	 aricVyz3cg8yQ==
From: Kalle Valo <kvalo@kernel.org>
To: <davem@davemloft.net>, <edumazet@google.com>,  <kuba@kernel.org>,
  <pabeni@redhat.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <manivannan.sadhasivam@linaro.org>,  <linux-wireless@vger.kernel.org>,
  <linux-arm-msm@vger.kernel.org>,  <mhi@lists.linux.dev>,
  <netdev@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] net: qrtr: support suspend/hibernation
References: <20240305021320.3367-1-quic_bqiang@quicinc.com>
	<20240305021320.3367-3-quic_bqiang@quicinc.com>
	<8734s02b3s.fsf@kernel.org>
Date: Tue, 09 Apr 2024 12:29:54 +0300
In-Reply-To: <8734s02b3s.fsf@kernel.org> (Kalle Valo's message of "Fri, 05 Apr
	2024 16:27:35 +0300")
Message-ID: <87il0q28a5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_023001_557534_1BB3CD52 
X-CRM114-Status: GOOD (  13.93  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Hi netdev maintainers,
>
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> MHI devices may not be destroyed during suspend/hibernation, so need
>> to unprepare/prepare MHI channels throughout the transition, this is
>> done by adding suspend/resume callbacks.
>>
>> The suspend callback is called in the late suspend stage, this means
>> MHI channels are still alive at suspend stage, and that makes it
>> possible for an MHI controller driver to communicate with others over
>> those channels at suspend stage. While the resume callback is called
>> in the early resume stage, for a similar reason.
>>
>> Also note that we won't do unprepare/prepare when MHI device is in
>> suspend state because it's pointless if MHI is only meant to go through
>> a suspend/resume transition, instead of a complete power cycle.
>>
>> Tested-on: WCN6855 hw2.0 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> Could I take this patch via ath.git tree? Full patch here (same patch
> but links to both patchwork projects):
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240305021320.3367-3-quic_bqiang@quicinc.com/
>
> https://patchwork.kernel.org/project/netdevbpf/patch/20240305021320.3367-3-quic_bqiang@quicinc.com/
>
> I ask because we need it to get hibernation working on ath11k (and ath12k):
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20240305021320.3367-4-quic_bqiang@quicinc.com/

No reply from netdev maintainers but as the patch is marked as 'Not
Applicable' in netdev patchwork I guess they would not have major
objection to take this to ath.git. It should go to net-next in the next
wireless-next pull request anyway.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


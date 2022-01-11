Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED56C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp+9B7U4Y/8YxFI9wvoMQWia3dzsEqHBJHiJSdNVuX4=; b=Iu1GAG8RL77/Qi
	CCfRk5MM2nwZJSGw1MOinf589zbQyX4pAJXfX4YTOSv3RYBDB5s/RTBFryHhR3sB96n1+fBB7ce4R
	Q1TXe6kwN3HB7nFXqmYy/iLwpdKzi1k/UKSmHMZLXezkw2fBlXE/WNNQH9fj9b2qEIDeLA1pdoVlJ
	YU1IHVKVu8fV9a40cguprUAzckmhFwZKikyYZw2pDLcndppw4GqfVUFnkaUmwqE68IruAShuocPlC
	JAM82qIgDG0GelshND54ddbCWN7AC5Ggvt74QaP+JnEPBai0WG9sQdi0ZGM5YnKgIeAFp4JHwRftR
	EUYM9GdignG2hIC26yUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HJJ-00GQ8C-Ci; Tue, 11 Jan 2022 13:35:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HJG-00GQ79-8H
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 13:35:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCC1C61624;
 Tue, 11 Jan 2022 13:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5284C36AE3;
 Tue, 11 Jan 2022 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641908133;
 bh=E6vq7mGYlar1V1IksYVxaMCyfvE9nSU8LuUCOABZB6U=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=DPwHqQ4aW2BbFIsHrMxYbCb0LnkTiTvVzygOKqUqz0jUax6MtvBwO4iilh8/c7w22
 52RW/Wyq1aeJ+Ec7c1ZdldjhC8/S3HFxqrgBDp/Cofk4qOOOSuvgCoPaBYIRXf8dgm
 Dvwr0HWgAyUuxJ6rVQZLFnkSRNzXyHpOPlWXThd8Hv34jjbvEP61aMqXXS6GS5ajWr
 LsTMpxXBTSfC2LDQkL38e284Ynprs+AMDdtK53uab5ezdRfMUEOgPgYMq01qmBeq6t
 k2c4n77RoyQX5YWFtxznBM372BiqDqHmZxVUhMO0VScNFmgkgCu4WScaMgya8okzjE
 NvwAK7PP6lt+Q==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, Wen Gong <quic_wgong@quicinc.com>, lkp@intel.com,
 kbuild-all@lists.01.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [kvalo-ath:pending 52/56]
 drivers/net/wireless/ath/ath11k/wmi.c:5651
 ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol 'len'.
References: <202112110427.o6xDAKfE-lkp@intel.com>
Date: Tue, 11 Jan 2022 15:35:26 +0200
In-Reply-To: <202112110427.o6xDAKfE-lkp@intel.com> (Dan Carpenter's message of
 "Wed, 5 Jan 2022 15:21:42 +0300")
Message-ID: <87czkyv1i9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_053534_394514_C6348FF0 
X-CRM114-Status: GOOD (  12.98  )
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

(moving from ath10k list to ath11k list)

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   34cbb4043dca455fca888e1ced323e588912b6a2
> commit: bc5c448b70ff141f8a2b5cbbab79fba08d7a1be0 [52/56] ath11k:
> report rssi of each chain to mac80211 for QCA6390/WCN6855
> config: riscv-randconfig-m031-20211210
> (https://download.01.org/0day-ci/archive/20211211/202112110427.o6xDAKfE-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 11.2.0

This was a test commit in the pending branch, I applied the actual
commit as:

b488c766442f ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/wmi.c:5651
> ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol
> 'len'.
>
> Old smatch warnings:
> arch/riscv/include/asm/atomic.h:317 arch_atomic_sub_if_positive()
> warn: inconsistent indenting
> drivers/net/wireless/ath/ath11k/wmi.c:5674
> ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol
> 'len'.
> drivers/net/wireless/ath/ath11k/wmi.c:5695
> ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol
> 'len'.
>
> vim +/len +5651 drivers/net/wireless/ath/ath11k/wmi.c
>
> bc5c448b70ff14 Wen Gong 2021-12-08 5629 static int
> ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
> bc5c448b70ff14 Wen Gong 2021-12-08 5630 struct wmi_tlv_fw_stats_parse
> *parse,
> bc5c448b70ff14 Wen Gong 2021-12-08 5631 const void *ptr)
> bc5c448b70ff14 Wen Gong   2021-12-08  5632  {
> bc5c448b70ff14 Wen Gong 2021-12-08 5633 struct ath11k_fw_stats *stats
> = parse->stats;
> bc5c448b70ff14 Wen Gong 2021-12-08 5634 const struct wmi_stats_event
> *ev = parse->ev;
> bc5c448b70ff14 Wen Gong   2021-12-08  5635  	int i;
> bc5c448b70ff14 Wen Gong   2021-12-08  5636  	const void *data = ptr;
> bc5c448b70ff14 Wen Gong   2021-12-08  5637  	u32 len;
> bc5c448b70ff14 Wen Gong   2021-12-08  5638  
> bc5c448b70ff14 Wen Gong   2021-12-08  5639  	if (!ev) {
> bc5c448b70ff14 Wen Gong 2021-12-08 5640 ath11k_warn(ab, "failed to
> fetch update stats ev");
> bc5c448b70ff14 Wen Gong   2021-12-08  5641  		return -EPROTO;
> bc5c448b70ff14 Wen Gong   2021-12-08  5642  	}
> d5c65159f28953 Kalle Valo 2019-11-23  5643  
> d5c65159f28953 Kalle Valo 2019-11-23  5644  	stats->stats_id = 0;
> d5c65159f28953 Kalle Valo 2019-11-23  5645  
> d5c65159f28953 Kalle Valo 2019-11-23 5646 for (i = 0; i <
> ev->num_pdev_stats; i++) {
> d5c65159f28953 Kalle Valo 2019-11-23 5647 const struct wmi_pdev_stats
> *src;
> d5c65159f28953 Kalle Valo 2019-11-23 5648 struct ath11k_fw_stats_pdev
> *dst;
> d5c65159f28953 Kalle Valo 2019-11-23  5649  
> d5c65159f28953 Kalle Valo 2019-11-23  5650  		src = data;
> bc5c448b70ff14 Wen Gong   2021-12-08 @5651  		if (len < sizeof(*src))
>
> "len" is never initialized.

I only quickly looked at this, but AFAICS ath11k_wmi_tlv_iter() provides
len to ath11k_wmi_tlv_fw_stats_parse() which again provides len to
ath11k_wmi_tlv_fw_stats_data_parse(). I'm not seeing how this is
uninitalised, did I miss something?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

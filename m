Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58530C47258
	for <ath11k@archiver.kernel.org>; Wed, 17 Jan 2024 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYExs+W6qIRgU9Ny6qCdrGjU3yi2VKCDagSq4S4ku7E=; b=FySLBB08BNB9YD5pwbKkMoSv0Z
	fwShrLsqzyrNxrsm4fSanT1JjU/su754yXvM6rEiMMj6ZgTXsIzacVOAMbZGL+PBDAo9c+jOThQjr
	RwRVV04VMPtmzr605RXPbWDRXzneM2h0M20Pe6fqYjesJtJfRMfcE/kknwRxNcJ5MQd6jmELMTgrh
	CSUFJqZzgQIudtnRVaGnCRnn5fRkCBqKx6axFypl3Y5P4dxhLS5OzKpGTxdgdYBmMIQ74i3eNeEnz
	o5/aDFcni+lCoJRM9pG4Myx50DcEoT5O3uFHhJ8r5fyaowj+9ErtukluLll+6R3FVzoGbv4qnt8kZ
	QEP0cCPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQANC-000Jfs-0f;
	Wed, 17 Jan 2024 18:10:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQAN8-000Jf7-2W
	for ath11k@lists.infradead.org;
	Wed, 17 Jan 2024 18:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14D406151E;
	Wed, 17 Jan 2024 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7FEC433C7;
	Wed, 17 Jan 2024 18:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705515041;
	bh=RTRyEp2WNcu13qaBMTceLYJiUr8QpjU4P2esWE0WBWs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qBl7Bvs8naFzAmPvyUpHcIl1d8CKQB11eXSTW2r9+fGKeNPQ6XAmlxM65bCoKypLW
	 T3tvJyvw8EKwBBFPftuFiQxw1I5ysnLaK4Fh4JfzakGCeXH4yjMUb3mf1xWHwH66lR
	 ygEX+m1pQDJ9Z4zUYWSi/CXHVZzg4EdupB2NqY4Gda2+eqCOHKCH1FxcUugnkw4lsp
	 AHBYZHb4/p4kebKMkwnVuUZnb1VoluebhhHTgGg3zG34siab+yxwqIsgb2OZkkaHK2
	 9DcOABGNsdJVFMMgA/b1x0R1Duo5ZKKlfBgSSU0eBCa6hwHXolf3FHOLt/UsM77Kyi
	 dnlFN8/McCE6Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <benjamin@sipsolutions.net>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  Benjamin Berg <benjamin.berg@intel.com>
Subject: Re: [PATCH v3] wifi: ath11k: rely on mac80211 debugfs handling for vif
References: <20240115101805.1277949-1-benjamin@sipsolutions.net>
	<26a42f14-dd38-4c67-8f66-16baaff25885@quicinc.com>
Date: Wed, 17 Jan 2024 20:10:38 +0200
In-Reply-To: <26a42f14-dd38-4c67-8f66-16baaff25885@quicinc.com> (Jeff
	Johnson's message of "Wed, 17 Jan 2024 07:14:18 -0800")
Message-ID: <87r0if4yqp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_101042_880562_18876105 
X-CRM114-Status: UNSURE (   8.54  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/15/2024 2:18 AM, benjamin@sipsolutions.net wrote:
>> From: Benjamin Berg <benjamin.berg@intel.com>
>> 
>> mac80211 started to delete debugfs entries in certain cases, causing a
>> ath11k to crash when it tried to delete the entries later. Fix this by
>> relying on mac80211 to delete the entries when appropriate and adding
>> them from the vif_add_debugfs handler.
>> 
>> Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs
>> entries as appropriate")
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218364
>> Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

This also passes my tests, thanks Benjamin. If there are no objections
I'll take this to wireless tree tomorrow and try to get it to v6.8-rc2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


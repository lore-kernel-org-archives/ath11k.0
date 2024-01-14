Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A201C4707B
	for <ath11k@archiver.kernel.org>; Sun, 14 Jan 2024 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gle7RXrMebez8TQY9xDvaqt4P4lmptCo8wlV5kYkpqg=; b=CHeS9dGZbpRtFAW4cAlekvhnXf
	duS8OhUb+2mupkDGoMr7RdgIvy0AVLFqzra9PrV6GRMFGYfqkm9dSVmaPBz4B2z8EQUQchBIwBzL3
	dDlwWovSQRPNV5bIXpLMkP+KVJ7J+WjdxIww/rVxuqlZw+dUKFJaIhE7jhyn2Hh1MmlFZsf0EloeD
	FKInSPc6fKedBkVRW8n+FiPPgA86tKngAFgQezW/2Xr2XC5+HPrp2vUxB35Cjt2WJXs9snIAkIS/C
	uid0OGz+Mhc4mjEDqHz8O6rkhC3t6o2TzZOY/HT/AyZqRu/CvOMtg24VggkC8l5ReYyhirgiyHqI4
	BZKAhVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP27R-006sCO-3D;
	Sun, 14 Jan 2024 15:09:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP27P-006sBY-0d
	for ath11k@lists.infradead.org;
	Sun, 14 Jan 2024 15:09:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57E3460BC3;
	Sun, 14 Jan 2024 15:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1863C433F1;
	Sun, 14 Jan 2024 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705244986;
	bh=KonVwvysHSEyFJbAjmUrw7TyfJrPr/NzwAPENtus/EA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dffpTODqOU1KwpxGdKP+9C7E1MKQ/ZTW8B5SxTSMpeDocSxUTih+LLZWsYBedL1C4
	 y29rroLqpHLE7E7W7KRL+TWjVIFpALLQb/sa+zwZZqaEtsTjAVZssYc95BFH+OipWC
	 3IPdCzrqc1ZeU9gywp9p5luxqBfd4LDnY6TdQlucEBJ90tsjIcfwMdCsc0Xw1nvpnI
	 Q2r/DtYPZLxGuoW+4yORkTKR8xF+kf1IsZs4bU+dbF3lcnr2CzXwjsrGcjtOcVR7Ga
	 t/oyLUU3yYZSu35h3dfNYVH861ebw6eoP4DSP24GXcF9GzVi2yZwIlEtdK4hYf6/lL
	 f+7VDUbuik0UA==
From: Kalle Valo <kvalo@kernel.org>
To: benjamin@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,  lenb@kernel.org,  Benjamin Berg
 <benjamin.berg@intel.com>,  ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: rely on mac80211 debugfs handling for vif
References: <20240111170629.1257217-1-benjamin@sipsolutions.net>
	<877ckfip1g.fsf@kernel.org>
Date: Sun, 14 Jan 2024 17:09:42 +0200
In-Reply-To: <877ckfip1g.fsf@kernel.org> (Kalle Valo's message of "Thu, 11 Jan
	2024 22:38:19 +0200")
Message-ID: <87a5p87xzd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_070947_277895_711BCBC0 
X-CRM114-Status: UNSURE (   5.98  )
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

Kalle Valo <kvalo@kernel.org> writes:

> benjamin@sipsolutions.net writes:
>
>> From: Benjamin Berg <benjamin.berg@intel.com>
>>
>> mac80211 started to delete debugfs entries in certain cases, causing a
>> conflict between ath11k also trying to delete them later on.

Instead of calling it a conflict I would prefer to clearly document that
ath11k was crashing so badly that it was unusable.

>>
>> Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs entries as appropriate")
>> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218364

s/Bugzilla:/Closes:/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


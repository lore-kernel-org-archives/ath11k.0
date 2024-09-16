Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6B1C3ABB2
	for <ath11k@archiver.kernel.org>; Mon, 16 Sep 2024 06:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAs7HfiH92+MdPBIp+e0uUraw1yRewCYQMuTSB6qBYI=; b=G8OQygdW+BidL4xqC/l7h2Y/rF
	4MK3yNIkKahvYQILUIAljoSaY1pOiSZNztxcG9f0E6T0K+BOSEkFoQWs8dPgWG7bsqVh0EVLyV6ln
	6IDdexPKFK/n9zoz4d4922KWBHvPJq96KF4A8OQyBCks0QBf7KvRkQ5/HAiOvq9tRqktck+85elw5
	kg7YZvJQDss/4ZsPwc+IyK6tssPGcPjtorLWw/ZV+g88TjKB7kloDaFPzFIZplebYslfyCgBBgQRi
	I8akZpe8OvOehOJovI8I2lhPeum2JICF6ZVJulepB8IK/bClR89Y1fnXHNNSNJrH+2l+KqbfQs4pp
	A0ZQ+Mqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5g3-00000003FZg-1YbC;
	Mon, 16 Sep 2024 06:57:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5fL-00000003FFJ-0Tp5
	for ath11k@lists.infradead.org;
	Mon, 16 Sep 2024 06:56:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36F3F5C563A;
	Mon, 16 Sep 2024 06:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67F0C4CEC4;
	Mon, 16 Sep 2024 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726469813;
	bh=gjW+uEwPpRURu/Ef6KeECNDjwMQxU0zhPnnwdbOTLlo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=M/Nm8smynC0/BDjJb3Zv67xRRF1IfrGOO0l4IGvaFfi9FTDtKYGTZ0Nu5fkSBLUGu
	 T+2svb8cUWLLEB3OJWp74fu4YLxEUmYxnDtSEQbgoXERU+MFLWooQMFI6GSydrinNF
	 /sYBdm33Nf6Au9E/uxAmY6SOLvvGdgcL72/xr7LGP6EmiOL/i6nLsgK/A8HWFlIhPX
	 zy75RIOkSm9aLRVIgd4S8J/1+fw/EQKLgVJ91eYRgviy6YwXDPHEqJTK5xyJ3NyFqA
	 kjCs3HxQ/FyrCu7JSZCaY6AJ7zrgc07cUNevkqoD4hxqhjJ8XiqZYUbWLOieGbJShI
	 8Xml5PkbPsj3w==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/2] wifi: ath11k: fix full monitor mode
References: <20240913100708.756-1-quic_kangyang@quicinc.com>
Date: Mon, 16 Sep 2024 09:56:50 +0300
In-Reply-To: <20240913100708.756-1-quic_kangyang@quicinc.com> (Kang Yang's
	message of "Fri, 13 Sep 2024 18:07:06 +0800")
Message-ID: <87ed5kaxxp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_235655_214440_F7D43C74 
X-CRM114-Status: UNSURE (   5.85  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> Fix a warning and a bug for full monitor mode. With these two fixes,
> full monitor mode can work properly to capture packets.

On what hardware versions?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


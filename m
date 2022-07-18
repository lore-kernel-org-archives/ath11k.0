Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB08C433EF
	for <ath11k@archiver.kernel.org>; Mon, 18 Jul 2022 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqebzN+sGaffosgyAOPDdVyKP84glZh7DGP1PPcWP00=; b=K9KorWbzrwJEFo
	MxROnqqGLigkGTy5V8lUDkdHpTGJXoVIf1oFowfyrwrQBEFmrUn3D5OSf60GyAhaNN2edPJzfR2BG
	S6frLoWNPyiTKtCFXS4edUf0Jh5cVioWMWj5cySZviMed7OIr/CsJitrXC4WQrLFw/8rZMHrqdpkg
	F8rn64GsEsp+8Qw81QyXIh00jpRH1n32U7Ykvt8OcYGqD9HW4nclvKvbq245zrUIZu1xrIPSSfwd1
	IkIjfAemJae/pZLJp3+JX868KQ0oR7yjJMGmAIPvjFvPl4eao89n4tE11ZbV9bJ3xU/+D4NpcYWN0
	oCJmx+vLkTsUzrokIUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNaO-00CKjX-Dy; Mon, 18 Jul 2022 10:02:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDNaM-00CKiA-5x
	for ath11k@lists.infradead.org; Mon, 18 Jul 2022 10:02:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8BE760B1A
	for <ath11k@lists.infradead.org>; Mon, 18 Jul 2022 10:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDBBC341C0;
	Mon, 18 Jul 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658138560;
	bh=K2+Rg4IwZ7UtFKXFaxeaAVip/LVFwlROEd60n9RHjrg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jgvOpGtbRwbUsH6jMA4Gh9ANeY8g0ytyBj25Abgnb4Fsp05bo4w2guPr8oUzlDlfj
	 lbl/IsxIZbhsYUIY/+ffAB/C2MoudwjU/woGUoJofmsP5o2bSELqqVr6HAWyXAknk1
	 pYtqRpNSCAhnONypxgt2BdbVL8tS4qlxOktnj7ndCW3PwsB/4JoBQ9kNv6RF4yi+fd
	 QZAarnf+2ob9IIIKstnHl1LoECXjMRylBqNkRJhBHd+ursPj2IJB5WXXtj/NKgd2bm
	 IDFd4eTDCGthcTzQIepNgwLmjCKLfaxBpVn/RFwUtVzyHkno8V0EGVUbexlh75wdq4
	 bB9FMChdDgMKw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: mac: fix long line
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220708170052.28615-1-kvalo@kernel.org>
References: <20220708170052.28615-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165813855498.12812.2366239081191024787.kvalo@kernel.org>
Date: Mon, 18 Jul 2022 10:02:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_030242_289450_882546B5 
X-CRM114-Status: UNSURE (   5.97  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Recent mac80211 API changes introduced a long line warning in ath11k:
> 
> drivers/net/wireless/ath/ath11k/mac.c:1404: line length of 92 exceeds 90 columns
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fcc36be423a4 wifi: ath11k: mac: fix long line

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220708170052.28615-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

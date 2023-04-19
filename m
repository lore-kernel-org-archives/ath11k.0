Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B631C77B73
	for <ath11k@archiver.kernel.org>; Wed, 19 Apr 2023 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:References:In-Reply-To:
	Message-ID:To:From:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmjP9KRcLyZAUceYJHgiyR+Y1XpSEicNZn7XcjofLYU=; b=X03VvPVsCETJBY
	GJbEO4y7faCKk+SEQI8YoLwKVlygXRxGNY7ImBmaefQJnLm6lkvbmX5q9qHRWhcEBLraEoFXh8ow/
	gfDXp5HKIeJmLv+d/4cTAzOViWFgTz1fkC890lBuWsiU+iDoq0bJQPl38TuIjx0rD3HmY3fE77oRz
	XDmRpWQbkj0te+aUu7GL+NajBPBBsTr6WccA2NOdm1q6ToP14aq9d2SKoc9kXuF0jGSs5xeiBih58
	s9tByQwcicF+7lyBAvOKAc25SkERNOC/JQeZdkn1/D0avTpeD61DtVLiVoxGA7Pyzs3iChMmC+/5q
	IxKr6pdPwFw1Pot3hveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8zh-005hee-1X;
	Wed, 19 Apr 2023 14:41:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8zd-005hdl-00
	for ath11k@lists.infradead.org;
	Wed, 19 Apr 2023 14:41:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A25563FF4;
	Wed, 19 Apr 2023 14:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBA06C433D2;
	Wed, 19 Apr 2023 14:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681915265;
	bh=gTPPRV81BSS/cUoVriXJYgZjhP3pEp7MZXd0feEjlLw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=em71wt4LUn5vYzukpXN6sLZgl6Gp7Zc6hBqiKfNHP2QqUjnXBSvMs2O4J4FCO1EyY
	 2nRVuLUQdBg5N6jLY4egIWjaE8KpMkd4Kq3VzWt66udzYF6Vb9mLMMaVGuiO0kqKA/
	 eaNO+hObmOyhgfimTOhnNQt2eKHrN4IEqftRdsayoNMWPPz1gAR7Wl+6fEOd1Q3Kkq
	 ePi10OwoVPtNimmpVjwvqkXoglY6a6r2aeyoC3KE/jVwkoBqBRNfxqusylEKp6g/yF
	 u65XnI3fEH2/KpB0XMqavJyuQYMyq3n3RaTgF06awpCKaiEUhRhbNZMSq8kONKIR1G
	 Wq5JwW2jIwr9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC3F3E3309C;
	Wed, 19 Apr 2023 14:41:05 +0000 (UTC)
MIME-Version: 1.0
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: quic_msinada@quicinc.com, ath11k@lists.infradead.org, 
 quic_akolli@quicinc.com, kvalo@kernel.org, linux-wireless@vger.kernel.org, 
 robert.marko@sartura.hr
Message-ID: <20230419-b217299c11-fb15135c977f@bugzilla.kernel.org>
In-Reply-To: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
References: <1666128501-12364-1-git-send-email-quic_msinada@quicinc.com>
Subject: Re: ath11k: regression with 80+80 and 160MHz channels
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: network-wireless
X-Mailer: peebz 0.1
Date: Wed, 19 Apr 2023 14:41:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_074109_092316_1FF91CB3 
X-CRM114-Status: UNSURE (   5.50  )
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

kvalo writes via Kernel.org Bugzilla:

Fixed by:

https://git.kernel.org/kvalo/ath/c/b100722a777f

View: https://bugzilla.kernel.org/show_bug.cgi?id=217299#c11
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

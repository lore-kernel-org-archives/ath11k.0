Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB74C433EF
	for <ath11k@archiver.kernel.org>; Sat, 19 Feb 2022 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fOa7VKKWS63Wo6wzrkOhy0M7gL5TTllsujbkYQq0LNA=; b=P7/
	Up6vsGgtO0bo1cGxPPZqmCdIlNin+SdKERT8/R/ultn4TTX8OeTKtS6lIAqIgWA2C0wowUxjt4FtF
	qtrCcZBdBz66iHLhCfXDxIsG3lX814rgMuQWmI603qanR8mSgPkSOsMusIMsubPOMLxAxqJXKi3X/
	zh4W762ahRLYylbOA2ZOO4AOc7O3KP3519OSJQM1cLxYoMzbgNYUhdTSxCz5dO3h1VWKrapYrT1ot
	RnX/IKK6t9k13qUG/KZJxStsEwMEJYhMBYVvsdVp/fCg3vFtb4oMyUF4B5k1spSz2VhT52plfTQ/h
	Nr9fPyVqLmBhdY3QoCizBA7ttk1dCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLQFl-00H230-Pd; Sat, 19 Feb 2022 13:58:25 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLQFj-00H21z-Cv
 for ath11k@lists.infradead.org; Sat, 19 Feb 2022 13:58:24 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id p7so20539187qvk.11
 for <ath11k@lists.infradead.org>; Sat, 19 Feb 2022 05:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=htDYgbLS6Uq6NGJUKBzNMebz9P0JiluLfyk0AW9X4D4=;
 b=o7/LvJdAe94k3UA5+ONcM92EWvDSt0E2GxaRqPA3uHpMwnX+u5H1+ie1MZn3IgDTcr
 tXkTgUpGZssdQkQ4qvf4TAdeNFS1IKzCMhr/ZtE2SoOb2plCaTs1sLL6g3d7dDqbu/nK
 MaNdtBG7bUvsNNjRCvj/AhKz7B10rWZn+fTus9XJz/C6SSy+XLD6tXO8Dwf9Qj9WzUtP
 fTrIGZNjsmIJQyHQ6bpymyF9iiI+5lWtEWg1mftjz9ERxxF45B7FbXiNxpWbLp8cDIcb
 +u9UJm15T6mkIvr3dVXZ1IeMgo51wTFi68bjPS94V8/kUE15xXBC8TSWxVOf+V8Q6eG/
 HGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=htDYgbLS6Uq6NGJUKBzNMebz9P0JiluLfyk0AW9X4D4=;
 b=W0bCqrxzh1TMH12o4/UceQhcMLIP76ovr3dLFLIp0UPUXrP8Vqf0vfqweubwWVeH0r
 T23JPYEV2F+8ocKlN1Vzola6X/Slwq+8vOXOZ/bdkXqsnpQ/kvAz9trIKnpyycL+NDuH
 9z3uzqOIDXM9xnpbv8Auf7MNQxAMAIy7uEpoRFk/GYpmJ7SDp1dLOep1PO9YFVE97UXq
 k8h9p8PKe2BY8Od01Inja3GdwO8w+q+BFV4g+nFzBc4T5V2/1KBXgGUY3wHn4NnhSCSd
 v2jSTlSykHK5XGOnz5idiIR+LromTA+nZSkP2C3ypjXvocth/0fioCBcbec5drZuiQoY
 bNPw==
X-Gm-Message-State: AOAM531PNsfwpI6+ohyHNOglhf/KECPiEQE77NAtCs2oVBajErOhSliP
 tfE8vEtdijyk8+BUJ2t72WkA4RJp5dlSezysXzYkHk94b1Vpzg3y
X-Google-Smtp-Source: ABdhPJxrbGWwfqT7a5pkr+aiV90h6Qb1nzaWVG59OeQWTO+x/J64lnHdIdEG9fwnXwMoZEzLn4BD27ZMexaisjTSA/0=
X-Received: by 2002:ac8:7f83:0:b0:2d0:1769:f2c1 with SMTP id
 z3-20020ac87f83000000b002d01769f2c1mr10868760qtj.427.1645279099896; Sat, 19
 Feb 2022 05:58:19 -0800 (PST)
MIME-Version: 1.0
From: Xell Kim <gfzmder@gmail.com>
Date: Sat, 19 Feb 2022 21:58:09 +0800
Message-ID: <CAH=Zo0eZp+Cqw=C0PWuirKM23ptWM053=ygVRhYq0BcFGevahg@mail.gmail.com>
Subject: o wifi connections available in Manjaro Linux
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_055823_464893_1F53B605 
X-CRM114-Status: UNSURE (   7.92  )
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

Hi! Sorry to interrupt you. I'm a manjaro user and met some problems
about the wireless configuration.
My new pc has Qualcomm Atheros QCNFA765 as net card and the default
driver for it in manjaro is ath11k. However, wifi service seems to be
unavailable and there's even no wirelessLAN interface in the rfkill
list. Besides, I should mention that the wireless service could work
with no problem under Windows system.

I've noticed an error info " mhi mhi0: Direct firmware load for
ath11k/WCN6855/hw2.0/amss.bin failed with error -2" but have no ideas
how to solve it.
I also tried modprobe ath9k but it didn't work. When I try to modprobe
-r ath11k_pci, my terminal got frozen for minutes and I had to stop
it.

More specific info can be seen in the link below:
https://forum.manjaro.org/t/no-wifi-connenctions-available/103091

I would really appreciate it if you can help!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81843D2502E
	for <ath11k@archiver.kernel.org>; Sun, 11 Jan 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+WhVxuZ7iB5LTebgjeJhW2mbmqDhn5y1OfYKyu+1F4=; b=0UKuJopOD8uKiiHGuWNPEx3v3s
	1uwLXsIJIxlpUtN54KcQg8FSKmBZwww8pq8uRQ+Of97jnHWKMLDvsHGOQIPP3bJNBIxyeclSsC9hP
	v+BGc45SsjPd2/mQ1Z/9WwbwAfyu82OVjvMiK++hPeWmY0moGjUu5DjJw+OcIclgl4OahNkBT54p3
	2ODqLgs/5TuU/KV/Ip7guhqM3/X7AIUR2Rpj1/Q/PLSLS1oDZJ4urpcWYGEglcOaD9LN37fROlj0H
	nUxKwc0SwEsAt+hF95qpl/qeQNBo3NifEwgtiXO/G5DK/B2gXNSin6fnVgv+yfa6Bh76onp7sZTf7
	alPyLcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veszE-000000048mU-43El;
	Sun, 11 Jan 2026 10:47:56 +0000
Received: from forward500d.mail.yandex.net ([178.154.239.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veszA-000000048m2-1ynP
	for ath11k@lists.infradead.org;
	Sun, 11 Jan 2026 10:47:55 +0000
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3cca:0:640:f0e1:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id 3137480CAD;
	Sun, 11 Jan 2026 13:47:41 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id blOeGckGma60-SURPuzOF;
	Sun, 11 Jan 2026 13:47:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1768128460; bh=P+WhVxuZ7iB5LTebgjeJhW2mbmqDhn5y1OfYKyu+1F4=;
	h=From:Subject:In-Reply-To:Cc:Date:References:To:Message-ID;
	b=XvYbx5sk9Q4siksskgtYSMorrtmgYt7ly5q74ZBvZr/eUdS9PV2E9YkHWFDuYJCS7
	 jKNe3Yhuj9RhT23SDD6vRzGEbbeqB9l5JwkapOJu7I3HWTItm2OEx9uNYPzEcimQ13
	 sXmhuq5j3xzxsnn+QuhHJK2els1l/Pt9WdLbie/o=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <b410fa3f-0241-4805-afb0-efb950e04bd2@0upti.me>
Date: Sun, 11 Jan 2026 13:47:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tiwai@suse.de
Cc: ath11k@lists.infradead.org, baochen.qiang@oss.qualcomm.com,
 jeff.johnson@oss.qualcomm.com, linux-wireless@vger.kernel.org,
 mpearson-lenovo@squebb.ca
References: <875xaypnkz.wl-tiwai@suse.de>
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <875xaypnkz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_024752_765586_6DAE0973 
X-CRM114-Status: UNSURE (   4.63  )
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

Hey folks,

Sorry for bumping an old-ish thread, but I've had the same issue on a T13 Gen3 machine as well (model 21CG), and there seems to be no better solution in sight.

Also, here's another instance of what I'm pretty sure is the same issue: https://lore.kernel.org/ath11k/6268b094-5a40-40d8-8461-9c9b0f9e1ae3@oss.qualcomm.com/T/#t

Can this get landed at least as a temporary workaround? Also, should I submit the 21CG quirk as a separate patch?


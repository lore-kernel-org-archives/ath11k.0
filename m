Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE038C52D7B
	for <ath11k@archiver.kernel.org>; Wed, 14 Aug 2024 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:To:From:Date:Reply-To:Subject:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ziQd9n391InLwOucwM2eKmDg4fjqfcWpvGK0LdZ3qo=; b=XMcVgIJ6DjseJqyt/mbqmXXcvB
	/pYNBy9BiBucaYFiqoxCW5BlPTDmLp+n7TgMjH+gY2kr4WSKACIMXfPZ8Zjnu0Js1+emUFyKFNU9D
	Uo/XLjkTrvi8zY60Wvde8J9zWkigK0buVqpPZ6hqySblKCKjN/zy2T1MiIgvyIo1XsqPx3ySUDgzE
	WyawwmiH1NulEaLWWTiq8OHLBfRWxn9TlLTDeWWgsQKigaJFhlPTG4O9vrQpdJao3t5mBtCEykEWU
	McyNTGGb9cNzSOgT1sqQaxzECrPFQcioOHgi58f0yVSpI7rg35mnBBVgJm1ANBo2vR4ZN4AtCuk3E
	VYAOnM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seB3N-00000006XsC-1mqa;
	Wed, 14 Aug 2024 10:16:29 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seB3F-00000006Xnn-2fBI
	for ath11k@lists.infradead.org;
	Wed, 14 Aug 2024 10:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Mime-Version:Message-ID:Content-Type;
	bh=3ziQd9n391InLwOucwM2eKmDg4fjqfcWpvGK0LdZ3qo=; b=SEw/rDSbTzJP7
	GnnjEukfPD9YBO+AFQ0pFad7d6XcuG92JGUzovPXH7tJhem7eA40hdG9fRwCsRSC
	ejWd3tVIioR915wyoRPtgPjQYMGFlyMSCG/9/lsOJgdyDDDDdrzu5zUlYxkuMQU/
	lWLjUbva0L5cz5ZgGx9FMOvuS4ogFk=
Received: from doopood (unknown [120.245.112.169])
	by gzsmtp4 (Coremail) with SMTP id qCkvCgD3X9jwg7xmIVf_AA--.16275S2;
	Wed, 14 Aug 2024 18:16:17 +0800 (CST)
Date: Wed, 14 Aug 2024 18:16:17 +0800
From: "huaq_li@126.com" <huaq_li@126.com>
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-Priority: 3
X-GUID: 15BDA6DC-89E6-481C-A247-6EE3FD5715C0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.306[cn]
Mime-Version: 1.0
Message-ID: <202408141816161456114@126.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64
X-CM-TRANSID: qCkvCgD3X9jwg7xmIVf_AA--.16275S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RAjjgUUUUU
X-Originating-IP: [120.245.112.169]
X-CM-SenderInfo: 5kxd1slol6ij2wof0z/1tbijRE7K2WWgmlXqQAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_031622_112177_AA38E711 
X-CRM114-Status: UNSURE (  -0.10  )
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

c3Vic2NyaWJlIAoKCgoKCgoKCgo=



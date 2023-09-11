Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F253BEE57DF
	for <ath11k@archiver.kernel.org>; Mon, 11 Sep 2023 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JRW/Hoy4Vwl/QVyvwC737J9DnomQX6Bdik1HzIuP4e8=; b=3NNw6S3rcvo0P9
	uKAQtPhxP7QGlBrfrqHKJ2vsvz22NZNjikEvKeiyFiN+0GqIadTNMjlGeiFxvLwVxRB8goQdSGhj7
	wDg5t7t3yBXr6V2CRD+7Jd25ciiKmmiL0N9JIv3YsQwqrlZ2eQpjWj+CHP1FN6Z9m6GAEvOjGLCy8
	KcQVd+AQ2JEMeuNC/zLq1m+o+E1yMTYtIfF7IruIH82+wOFYFqsbekYIsTJgOa0lFrFEHVjkoQTg7
	ROPp16qn+KKAWY3/80/3yN2gHuaQCeWsD0by4pZ9iMpKCXzFWbqdaYL3uU8Bp5gwJ8zxs7fDNJISC
	XxGlYVkENMm0qvkZS63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbh9-00HTLT-1H;
	Mon, 11 Sep 2023 07:50:55 +0000
Received: from mail.alsdel.com ([135.125.191.231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbh5-00HTK1-1J
	for ath11k@lists.infradead.org;
	Mon, 11 Sep 2023 07:50:53 +0000
Received: by mail.alsdel.com (Postfix, from userid 1002)
	id 0BE7043E59; Mon, 11 Sep 2023 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsdel.com; s=mail;
	t=1694418645; bh=hs8UwfSprGlpLexiYoB0TOycWmyQ7zBilKt0OUVnHus=;
	h=Date:From:To:Subject:From;
	b=vDy5r200wxvXlpV4ntFNNkorqCeghpeV3qVGb213kn6J0zMxAUbwGUGYooen0ULtA
	 /RKmN9wQJ22WE8B0/q/7vRllAmbB1t8FoSOxan1PFlFhXM3mkLpRp2VDgt/ISNzdVD
	 R4Hqy5k38DzZDQYD8jvz7HHpcwslE5P1DzMOrfcHwV1niK34nHR4gB9/HK1rg95lz6
	 Yt8crDoiUKa8h+ap9/1rLYqhZS0tQg7Re8cI75Z9oVxn2r0kcoSqLIpHFqqdpobtWi
	 yNpxjG6MLM+rQIO/Rqg4XlBiDS3T23BAvfkZTbrSGPuyS3uEVnOzVd+Jdr6ebRqMiv
	 PwNpTXGC3yzFg==
Received: by mail.alsdel.com for <ath11k@lists.infradead.org>; Mon, 11 Sep 2023 07:50:41 GMT
Message-ID: <20230911064500-0.1.26.ggkx.0.4qbzku4ob2@alsdel.com>
Date: Mon, 11 Sep 2023 07:50:41 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Niszkowski"?= <mikolaj.niszkowski@alsdel.com>
To: <ath11k@lists.infradead.org>
Subject: =?UTF-8?Q?Roz=C5=82o=C5=BCenie_zobowi=C4=85zania_na_raty?=
X-Mailer: mail.alsdel.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_005052_230831_7D45A9B3 
X-CRM114-Status: UNSURE (   1.26  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKY3p5IHpvYm93acSFemFuaWEgUGHFhHN0d2EgZmlybXkgcHJ6ZWtyYWN6
YWrEhSB3YXJ0b8WbxIcgbWFqxIV0a3U/CgpKZcWbbGkgdGFrLCB0byBjaGNpYcWCYnltIHphcHJl
emVudG93YcSHIHJvendpxIV6YW5pYSwga3TDs3JlIHBvendvbMSFIFBhxYRzdHd1IHVtb3J6ecSH
IGljaCBjesSZxZvEhy4KClByb3dhZHrEmSBrYW5jZWxhcmnEmSwga3TDs3JhIHdzcGllcmEgcHJ6
ZWRzacSZYmlvcmPDs3cgdyBjYcWCeW0gcHJvY2VzaWUgcmVzdHJ1a3R1cnl6YWNqaSwgb2Rwb3dp
YWRhasSFYyB6YSBwcnp5Z290b3dhbmllIGRva3VtZW50YWNqaSwgcG9kasSZY2llIG9kcG93aWVk
bmljaCBrcm9rw7N3IGkgIGtvbnRha3QgdyBQYcWEc3R3YSBpbWllbml1IHogb3JnYW5hbWkuIAoK
Q3p5IG1vZ8SZIHByemVkc3Rhd2nEhywgY28gbW/FvGVteSBkbGEgUGHFhHN0d2EgenJvYmnEhz8K
CgpQb3pkcmF3aWFtCk1pa2/FgmFqIE5pc3prb3dza2kKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==

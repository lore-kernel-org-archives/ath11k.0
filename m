Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86491C5DF81
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 15:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhTDr6LdKbqjS7T4pxiNEPUA2fjb3YuiIILv6oehXMw=; b=I2CmpwJ9PUSQdQZFb/11x+AflD
	gA8nING+v++RnHL8rtPzKxjl7F6grYijSrJAVHb0jfPA7AUaUV6k6TfwqpLiFNcywmnypyHt3O5xy
	mNCQVwRAQty3HMPhAGBuqwfUimYuC1A+rpVI/bSVdEYm8hgJfo0yUQbqwhJKjeKh8Y3NKk/ELnAIB
	voNI3qzHH3sbX8S3NO8YDD9zo6SrnBspNMd6Ms76ETqVY8UFyLQXJN6HrW+ptD2/vBYi5VvBX2uw8
	PJQlqjPMxnwmYXe3luA9Qoupyvf2Y9zR9D7NDhtM1FTh29KydxRUaPIyNQnO/9KFsfP5KVCORrx9y
	6pgDhlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWq5-0000000Gx6H-1xbK;
	Mon, 24 Aug 2026 15:43:57 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWpw-0000000Gx3t-1mJq
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 15:43:56 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c15f020a223so537349866b.1
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787586226; x=1788191026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhTDr6LdKbqjS7T4pxiNEPUA2fjb3YuiIILv6oehXMw=;
        b=YvCuHEY+Bm70o1vyEZLoSBoinNmpbOaFkmcG3SZtEdYCkKK2W21lKJcgG7a/5GGyTZ
         vU2fQsqrjN6Ytp4N7xlu5yE5Aafvj+zoq80samOXT99ByraKoK9YU6dsXaZvu7+F388N
         aSu4Aa5DVaBw0MhGiw5RK2hT0g/66LyIGuSmfnW8vFxYeds+Zyw7mLTsznfKf7ISNlZj
         yFCERDg0BRoOJNAdX01Hp9ulbNlRrZbpGxwYRaSneU9wbp+01gKDqlgYxtLZw+uXm9Dw
         nwAHc2hioNrUGi8e40mffqTimTzk//4eYqR2FrpRcDZnVyKRA0HOV0i9UjQZR4pII192
         TszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586226; x=1788191026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhTDr6LdKbqjS7T4pxiNEPUA2fjb3YuiIILv6oehXMw=;
        b=q5AIjmBbeJir10TTLkIQF+dNKduXHimT/DHx8vD8X7O+dFa+Y6m/Rp5wQIZ4wpiG5M
         lhXTfv/mKm3p71ABU2z98RARduRDwIr+PvAl0GgVxRWoyLIK3Loqnr+BrWeP5ZyUGFch
         U+fi1j5dqKTG+Jn4S7nxj0orU4YeyRH6ZtTT9OX/4MEw0qlQ54yA6e94qlzk2nsU5VK9
         vihX0kVpRT87zSwdfducz6zVDHS90xpmJgJe/GubDLjjd9dEWG5TI4+Exa59OXVllR8y
         osl4570rhM8OwYbyTJ2xhHjZVmMz3Mp/H7feE0OnOY7Pv7E7i8hLMp/DJmNd2wM76QCw
         cZrA==
X-Forwarded-Encrypted: i=1; AHgh+RrHVvWreg+L747rBEXr2rJXYM1YH4AyyHaIk2Rj1AGvipkd0jffgz3mxBNkTve5mWqGmvcakxM=@lists.infradead.org
X-Gm-Message-State: AFuF++muRPzU6UPPDMUYE7qBcjeyPPcdDwpUUOcs/Y58EFQv6sjjAAKj
	BHx3mSYhAKdcOk3YgNuFhu0xYg4iHHDbIzLSiyIOWBPjMdtClvkSZO/4FKgtuvR2kbMOFBjAbjR
	X2aqpZ/NO
X-Gm-Gg: AR+sD13SKT6mq4w717NFWXH+P20sUY/oYIWKaXPkQJBMsJgkzQ+tC7U5v2VEY+nOGYl
	N/j42zPGzM2s5AHLY4seKFUmWflPFAxlt1997ir2ZJNTn7AMdoPMRAalrl5I3njypUlzQ6jHRhT
	C5VIlFbRJiVadupktNVfyKnzuewYEcOQ8hRXVxMDp49xhUcqazitHZmmHbXijN+UIDEU4AecClo
	Dp9f4kz+g39TDUzve+BAzbzh2sz3ru6qcXIkqK94aLjhA9KQbAeCfzahISrloEQR/NPudyVwl/Y
	HBWgAPrzz9p8h/Tq8MaTVxqSmPLA1DCjQYzKc68HrwEBEWCHbNIziylXC28iGsgW/bHl/tMK2nY
	U3ZVVriwRmTG+DMvZn0DMH1IpRkKESHXqjmnO3o5JtfSyLzYfVnPFRwzZlfB3HdJNXMWismNeB8
	G11JxipA7n2lryLq075Hh9fLvhFI7Kmv1+4iD0DsuMltokZd0PDBgsxZ66KzY8+qw2ljXWsnkjF
	+cu6iy/C6M39q56ChK5+fvkG7CPix4vsVH0u0uw6tCwuAHGMO/n5R9tYcLsYqdxTyJQdB+4cnoU
	cpSNiarFiEWV1bsGIG0FSVE9x97AFopXEc5rS0fFk6jdgTmi54tn23DdLcCiqli8UK5UYAkvQuA
	+fOo2u+XfxFX908D/VnSveZE14sYJ5J3ZmnquNLkM6v/27v0JRKvzoYb+Sfg8Eate/ckvExrm
X-Received: by 2002:a17:907:7283:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c24b11a493emr1268153266b.0.1787586226444;
        Mon, 24 Aug 2026 08:43:46 -0700 (PDT)
Received: from Desktop.fritz.box ([113.30.181.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm1270182366b.37.2026.08.24.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:43:45 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: Re: [PATCH ath-next v3 1/9] wifi: ath11k: free tx skbs through ieee80211_free_txskb()
Date: Mon, 24 Aug 2026 17:41:48 +0200
Message-ID: <20260824154306.2277246-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824142350.1757379-2-julius@bairaktaris.de>
References: <20260824142350.1757379-2-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_084354_990736_E2A55D71 
X-CRM114-Status: UNSURE (   4.02  )
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

+Cc Sven, Vasanthakumar and John, whom get_maintainer flags for the
lines this patch touches; they were missed on Cc for v1-v3.


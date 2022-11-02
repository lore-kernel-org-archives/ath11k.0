Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFDFC433FE
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 06:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTJXeIuViORrKqYMaRoPmojUKRIvYRGst75EqydPFLI=; b=sUxAWjhNa3IoBK
	ysozmTA3gRVspCTRtxxOTKOky5Ys7yF8maaR0+1PdKIkmCc8OPPU3M6GHFetVHh6AlWV1PEYnnduQ
	c1reD8Nv0s1+1GnFtp3xH0J9r7M/najyKIV9v2nXWD+p8FvIiQ6sAcvsUMEPzTNM96DUoTqWqzArn
	yzDFbaz+8HebTUhpLfKMmaaJgTbqv75jY3ejKmAAwTmWrOsxVVTia4W2eMOHW4Kn9XoS4CJyUtZw2
	Kv4R1CLma3cg0NxkS4OZa8t0Q3nrVEGMq0zvvnq3gxy0zTPEUW1p7KItObQUneaJHTDVIG6nutMgN
	Q8oALGo6hUmLqtN4a3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq74k-008QgO-Br; Wed, 02 Nov 2022 06:18:10 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq74e-008Qf8-Fc
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 06:18:08 +0000
Received: by mail-wr1-f45.google.com with SMTP id h9so23058343wrt.0
        for <ath11k@lists.infradead.org>; Tue, 01 Nov 2022 23:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyoiXD+lZAYyIq5A3unxJbUvSr0umu7gv7mLSuqlSJ4=;
        b=MKCnSeo7BKvOfbvW0BPHfw0dBELN2ShsmhYEtakViKxmI69+HI1Xej0kfLvXXlQIy5
         Fy7rTGIo33LD9IzZ/yC4lH8SxZy184ED7S978hO7H+Xg+JJVOncQKOKxtaQOFkmSklLE
         tIjENghXQn1O2YP3ogIefeAmoui8QIurIqqJrec6CLmj6g8U+n4Ux7j5dj06KQFKs9/h
         F/nFVwUhG8yKoXHAkyGwQ7IfUTd+NxxBfcMB5prBSswY5wzPAnO2/KhA/publtQUeB0d
         7QsS+6QFplVLAt3Nf+KqAcqIPbKXAwmq1RB74O9p16ywPiV6eGo0a76t9uYm79gGuagD
         Bwkg==
X-Gm-Message-State: ACrzQf0jTrJyrRcnBlqL/FyNRaSpQ4aCvm+AyNCcRCTT0zmdETZY8ARq
	ss9B7MiBNSJUk5doVJjAzMo=
X-Google-Smtp-Source: AMsMyM6NJ/87OZvYBlrVbXokU9DQLIfp/f10lKRDGr1BCob0gnkUi2pHO6BeN0qKMkHIYSEF8xWWvw==
X-Received: by 2002:a05:6000:3c3:b0:236:b2ce:593e with SMTP id b3-20020a05600003c300b00236b2ce593emr12638679wrg.580.1667369882322;
        Tue, 01 Nov 2022 23:18:02 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id 7-20020a056000154700b00236644228besm12830609wry.40.2022.11.01.23.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 23:18:01 -0700 (PDT)
Message-ID: <eeac01aa-5c3d-da4f-3acb-0698de23b2b4@kernel.org>
Date: Wed, 2 Nov 2022 07:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] ath11k (gcc13): synchronize
 ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-kernel@vger.kernel.org,
 Martin Liska <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20221031114341.10377-1-jirislaby@kernel.org>
 <55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
 <833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org> <87bkprgj0b.fsf@kernel.org>
 <503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org>
 <87tu3ifv8z.fsf@kernel.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <87tu3ifv8z.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_231807_741477_132DD1C6 
X-CRM114-Status: GOOD (  11.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 01. 11. 22, 18:19, Kalle Valo wrote:
> I did assume it will take at least a year or two before people get used
> to the new prefix, but my patchwork script has a check for this and it's
> trivial to fix the subject before I commit the patch. So hopefully the
> switch goes smoothly.

I think so. It will take some turnarounds for you before this starts 
appearing in git log output for every wireless driver. Then, people will 
start picking the prefix up from there ;).

thanks,
-- 
js
suse labs


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

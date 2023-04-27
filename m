Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08610C77B73
	for <ath11k@archiver.kernel.org>; Thu, 27 Apr 2023 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2N2yOKStT6Dr40mPfb175G4qbUIgiG8XVIySh2It8qs=; b=HNt5Uo/+ZMsSvd
	w2iIepn6Ex3Twk1mlL6n4U+H0FuNG8OZmMKr8wc7/og33M97j8sg2nisMl8BQkQgaeh8tFvfJmcVV
	n5peYydQgTl4uoSjUFNtc9am5J1JLgEmosohTPbCSUHsaGwlsR+LQlvthJpJuGuSqdd2rnD5YqhIC
	ZxgFzy/fNz/r23vi5ca3al01U/tdfe1vEA8//7CFz9AzRJZjvuAsT5619eelXSUt2AMmQbZGh7tR0
	mznkr0wAJMntQKYiLw2TxoqovWxEKF3nHWLnvTD6TG5R3M29SE9uyR275NAaTCdXxgX8WRbJ8+nR/
	KVE7X3I/mmslI07RXIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prvjJ-005cVr-1T;
	Thu, 27 Apr 2023 07:07:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prvjG-005cUT-1h
	for ath11k@lists.infradead.org;
	Thu, 27 Apr 2023 07:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682579260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KlogBekyk2gSeEekDg86LcWxQDtHbn1xGkaDN0V88A0=;
	b=Et77/lmWqklBqJ745Br0WlrONTiGDqFwzJvWVdFukWEgnvMQy6lzksT56q18DTw2m9sYCm
	d4QSeuIGkl0EFnbmfP1uFwtnlvqfepj4fkueIeCBjK3ghVzGDKxLeSFC1FV/vNf3Dn8Gwx
	Ozlh70Ai3SgPPr9H4ZGW4ybiztxKCXE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-VPoxKNiNNK669yQ9S6kzIQ-1; Thu, 27 Apr 2023 03:07:39 -0400
X-MC-Unique: VPoxKNiNNK669yQ9S6kzIQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3edbe09ba35so12442841cf.1
        for <ath11k@lists.infradead.org>; Thu, 27 Apr 2023 00:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682579258; x=1685171258;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KlogBekyk2gSeEekDg86LcWxQDtHbn1xGkaDN0V88A0=;
        b=giuXrfFEo0nzkAqZJN7ykhmVuLRSpYmuMuEGIWH+8+ccMlzT6TBhP4QPrxkXQhgUp6
         CTWMgMPa3vS/8f70cqDGYRRLYAzRu3D3VU3BGyImK4qxZ2w2uPySc/qdJrbyg2fjNkgL
         LYTEqR9zG4OxvlaMOAVgVcnLgxu7nrbQYYQ72aaTzP0Oz2kPsDDiSl0Jpk0mu2dPIPKk
         PWOrYOeiYggW1VmuyKlEesmX3wYgspNFynDhP6EqUhRG/E6DA4oVeMFqHdaIoKK43P0Q
         eCP5fCFzCUz5izxEsmoFKxO2EV013D5Y8vxFFTJYq9Qo8FOUJAlo1eGwj10Cl4J08Mpi
         aMwQ==
X-Gm-Message-State: AC+VfDx1QhRavMaF/4Th2OjWUwUubOb0mqE+2217MOnFgz17pLWLxRG6
	LIkNg/JktXPlT9sse+p4bOw/MP6wdZNXml5swQFBIVElE1I4/y/Yil4iHzj/R8wUi3b4C81cNDv
	AY1neq+1L74cmpyLwDC9Yuw==
X-Received: by 2002:a05:622a:510:b0:3ef:37fa:e1d6 with SMTP id l16-20020a05622a051000b003ef37fae1d6mr818902qtx.2.1682579258366;
        Thu, 27 Apr 2023 00:07:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5F3RtmIl+pQlfLGDCcC43NoGUaeEyMbtQ1c/nG8/GmJLAbwkFZxTzib2OlzZCRXxLG9aqQUw==
X-Received: by 2002:a05:622a:510:b0:3ef:37fa:e1d6 with SMTP id l16-20020a05622a051000b003ef37fae1d6mr818879qtx.2.1682579258051;
        Thu, 27 Apr 2023 00:07:38 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-243-21.dyn.eolo.it. [146.241.243.21])
        by smtp.gmail.com with ESMTPSA id w4-20020a05620a094400b0073b8745fd39sm2198762qkw.110.2023.04.27.00.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:07:37 -0700 (PDT)
Message-ID: <e05d4d4d33a2c50973d139752b4fcfad5dbdf056.camel@redhat.com>
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
From: Paolo Abeni <pabeni@redhat.com>
To: Kalle Valo <kvalo@kernel.org>, Christophe JAILLET
	 <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,
 ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Date: Thu, 27 Apr 2023 09:07:34 +0200
In-Reply-To: <87v8hiosci.fsf@kernel.org>
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
	 <87v8hiosci.fsf@kernel.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_000746_634427_52187435 
X-CRM114-Status: GOOD (  13.85  )
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

On Thu, 2023-04-27 at 07:35 +0300, Kalle Valo wrote:
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> 
> > ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> > look the same as list_count_nodes(), so use the latter instead of hand
> > writing it.
> > 
> > The first ones use list_for_each_entry() and the other list_for_each(), but
> > they both count the number of nodes in the list.
> > 
> > While at it, also remove to prototypes of non-existent functions.
> > Based on the names and prototypes, it is likely that they should be
> > equivalent to list_count_nodes().
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Un-tested
> 
> I'll run sanity tests on ath11k patches. I'll also add "Compile tested
> only" to the commit log.
> 
> Oh, and ath11k patches go to ath tree, not net-next.

Just for awareness, there are 2 additional patches apparently targeting
net-next but being instead for the WiFi tree:

https://lore.kernel.org/all/e77ed7f719787cb8836a93b6a6972f4147e40bc6.1682537509.git.christophe.jaillet@wanadoo.fr/
https://lore.kernel.org/all/e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr/

Cheers,

Paolo


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

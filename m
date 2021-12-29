Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D09C433EF
	for <ath11k@archiver.kernel.org>; Wed, 29 Dec 2021 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9GUoQoXiQeh1DjZ/C5HDjTkAPyhnoSRlMO39I9690w=; b=wM41qOdqDumRLm
	BZ9j/aoU0D1UnCYRueKN9WnN/2NBd0dwbvKAbUrsPANrRN1/ITvgQBvf/4KwEbfdcepqi/RTMm5MY
	ioAVgxrIi7/o5uSqXMjws3kd6BE4dEGz8z+kpOFa2+mDeZlcEjgRFhiVR7VIo9+CqIZFcEvmdhzqm
	+qW7lA2vxwjAJQnLhJNzwOi8LxVqg10hjLCtUmu1VqLhtJWHoG+gV9Wi7juoiSHGTsOTyc5kgfg6B
	w5QMST0VZverlNAjZFy7ByI+Ttrm4F/ZbaMI/mxQLlo2fLaJVEa3ORls+pg6ay6HaTa7jeMMG7EYw
	1Fwr2c48u+UvbX0Dn8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2cB1-0039e0-Df; Wed, 29 Dec 2021 16:51:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2cAq-0039YS-2w
 for ath11k@lists.infradead.org; Wed, 29 Dec 2021 16:51:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j13so16256368plx.4
 for <ath11k@lists.infradead.org>; Wed, 29 Dec 2021 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eyiokD87yXLE7dKoF/rAesIX6IaZjzEtJI7+LN04FEk=;
 b=jbps2qryj0Z0zQWn+lrBBlSxcDefe6KXi88QIlXKVc6Y7PKqWfUapjY8JxFcaIGigd
 ft7+84WoQ0h4UhL3vyJ1DIBHIIiAm5llGYmfk4nVkAe+3GrrBf97zhKbWsvTPX6JejKF
 1dkXJo0UGl+pIxJTyh0L4R8V7cOazLao67YG1WvcCgMJUT7Zmhf0eicJkPKKBztKsk7v
 D05fKDj1dOQc8zLv828bRzJys90kfBlRY+f583hLSA+S27xtYBrr/t46oqhBNzw2uXBi
 meZ8HORQpYNqIJLSkK446oH4j64Ut5bibHP4XsZdHoPvyO6AnHzKO5rs+vK+c+HbGKip
 7LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyiokD87yXLE7dKoF/rAesIX6IaZjzEtJI7+LN04FEk=;
 b=pGTN8NdHghDAxqDEKYcynIvKzsuLEC3QzO+T/fXxsl95UdtPr0p9eCDtGbqN3X8TA7
 RviGJ4Zm9lg6kgeAJLwKT2TgiKOp6Ig55GbTKOa7us80CD97hfkd8hvn160OAPJLM11e
 2KxuGnzrkEew3wgk2B1LJb3rhncDKxZUTjdCaEozSEnegosMfmf8LFGCT6v5Pzkl3EpP
 kGY9Yhm7hlIxGldcmpyFzYHoyLbOK7ULP898N8euCgRAF7Ey7eR3W4hSh8Aj6MzGDZTI
 t1qjd128KN9JM9mJeqtxLN/9kwMOJ7GIgaezSZ3IG6hmDBn6ZTY9KrXPLEUq/iGNjA91
 7K5g==
X-Gm-Message-State: AOAM533nTofOm2JcSUZX7Ir9I91ycaxlQmOJ23dHqu53Ud0m9n6elaCd
 Z3I2xVeCeCJ2+BxfjZmg6HHeaEDFyaH9dEKDLAk=
X-Google-Smtp-Source: ABdhPJxws7iMiWFQ81pkeV1J6AYDjsQKCDaoIm81c0ZOXt5vTQ/CRD6VrIFy5sdtzv5w8UmX3Hk8KIPfWDSHxOMnNg4=
X-Received: by 2002:a17:902:c443:b0:148:f689:d924 with SMTP id
 m3-20020a170902c44300b00148f689d924mr27252809plm.78.1640796694708; Wed, 29
 Dec 2021 08:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20211229004913.513372-1-kuba@kernel.org>
In-Reply-To: <20211229004913.513372-1-kuba@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 29 Dec 2021 08:51:23 -0800
Message-ID: <CAADnVQLd2y_Cuqrn+cAQzCjpXM_Lub5_X6xEfZdMMC2a2Jq41A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 bpf <bpf@vger.kernel.org>, Network Development <netdev@vger.kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, marcel@holtmann.org, 
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, 
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 mustafa.ismail@intel.com, 
 shiraz.saleem@intel.com, Leon Romanovsky <leon@kernel.org>,
 Taehee Yoo <ap420073@gmail.com>, 
 wg@grandegger.com, woojung.huh@microchip.com, Andrew Lunn <andrew@lunn.ch>, 
 vivien.didelot@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
 olteanv@gmail.com, 
 george.mccollister@gmail.com, Michael Chan <michael.chan@broadcom.com>, 
 Jesse Brandeburg <jesse.brandeburg@intel.com>, anthony.l.nguyen@intel.com, 
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, 
 Tariq Toukan <tariqt@nvidia.com>, saeedm@nvidia.com, ecree.xilinx@gmail.com, 
 habetsm.xilinx@gmail.com, jreuter@yaina.de, David Ahern <dsahern@kernel.org>, 
 kvalo@codeaurora.org, pkshih@realtek.com, trond.myklebust@hammerspace.com, 
 anna.schumaker@netapp.com, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Andrii Nakryiko <andrii@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, nikolay@nvidia.com, jiri@nvidia.com, 
 wintera@linux.ibm.com, wenjia@linux.ibm.com, 
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Ralf Baechle <ralf@linux-mips.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, 
 Cong Wang <xiyou.wangcong@gmail.com>, kgraul@linux.ibm.com, sgarzare@redhat.com,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Arnd Bergmann <arnd@arndb.de>, linux-bluetooth@vger.kernel.org,
 linux-rdma@vger.kernel.org, 
 linux-can@vger.kernel.org, intel-wired-lan <intel-wired-lan@lists.osuosl.org>, 
 linux-hams@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>, linux-nfs@vger.kernel.org, 
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, 
 "moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
 linux-decnet-user@lists.sourceforge.net, 
 linux-s390 <linux-s390@vger.kernel.org>, 
 netfilter-devel <netfilter-devel@vger.kernel.org>, coreteam@netfilter.org, 
 virtualization@lists.linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_085136_170951_BC20656D 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, Dec 28, 2021 at 4:49 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> sock.h is pretty heavily used (5k objects rebuilt on x86 after
> it's touched). We can drop the include of filter.h from it and
> add a forward declaration of struct sk_filter instead.
> This decreases the number of rebuilt objects when bpf.h
> is touched from ~5k to ~1k.
>
> There's a lot of missing includes this was masking. Primarily
> in networking tho, this time.
>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v2: https://lore.kernel.org/all/20211228192519.386913-1-kuba@kernel.org/
>  - fix build in bond on ia64
>  - fix build in ip6_fib with randconfig

Nice! Applied. Thanks

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

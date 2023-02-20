Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E5C636D6
	for <ath11k@archiver.kernel.org>; Mon, 20 Feb 2023 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLOqHF4HO4Euf5JA2XqVPmolW9xkkLBX5NJebFsWI9M=; b=0ceF42MPqUdefP
	eIB/OnYVFitoO5Qk4vZAn6wyv+dGh22wDiFyjhyMkglerixWIcDIC453UWUgrlB/U4me5GiMTAlEG
	aBGdC/MXt3KNRIhXGAdmtVb6bGa6/pOwbf8CcoA1e+gkHvxqM8ySndDVjfw+xseKs2Zm72bz+GoiG
	MG1ybJWAasUy3FPLXc1AiTXSp8FhIp9xhlrIF3t4leF9BOLcsbVzkaoyBh+TuIXuGSAkdm9fiPays
	oCdYOcUmQZz0l9HbHD/7AZ3i+9g2mn1y65lX2qtW93pikCOc67b0YeIx/bA2QpmKOytKklj0Zaf1O
	GEujtDEosJfYlmfrfHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUBcV-005Kvl-CA; Mon, 20 Feb 2023 19:14:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUBcS-005Kv4-QL
	for ath11k@lists.infradead.org; Mon, 20 Feb 2023 19:14:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id p8so2376983wrt.12
        for <ath11k@lists.infradead.org>; Mon, 20 Feb 2023 11:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2G8MngECsHzRoNNMvCe3AyTwuYcmDjYyCf7cYz5mro=;
        b=FiH+g/c3F+TK9/pTSWbaazdl0EjMRu4oWLJHOIVeiv8dixCeIrKhAeWTJH8ShXE6W2
         dPZLbuYov5gRflXDGfvx5xOBFVehL/BZ1N8PGZeqxDMEsfy+qAAOHCMxP7wXgsfkASND
         ul34d0snmd6kUn1Ekr1FTh8Dv/qEWqgAGcZYSR6RNXqdRG6iNnVgXL5xpUXXkmMdBa96
         TTE7Oq7KR7qB6n4DZGP2pEMcIDPX9599JYpREADFnD+1EG8QOj+fXVUueBNM7pHmzPxn
         gerWkPpuvWNu6gIU6eYgwy74TJ/Nu74KuQ45ZYTuV4cWaMtAaeekllkzoTFr6kh5g2kP
         628g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2G8MngECsHzRoNNMvCe3AyTwuYcmDjYyCf7cYz5mro=;
        b=XBlH4VI0gODc4R38OYQYU1iE0hOtdIXRADI/fMlR43mDxm+VAv92C7bqcb6JaqBTG2
         AZNvtIjaUlhwbkt4vWjIfGDt+8QHlTiNb2SWzUlAYYNaolbUNJVkRhjez8Yi/xDrng/o
         RYO/oWIWYAYDm7h/ESHHzjUOVFEkvyj4bsBuK2At33Ou+viNsdYQVMtQz0xxA8a6xUux
         uFecy6V4CIs5kAMpVdiepQ0F5HRq80q52Rvw0nPeBGdlArz+fh+ZFCa+V1mDF5V41w3M
         nD7jS/lbGWxLISbzBkfYD848hdqBmv9dBB9yaH+O/axWhhOGE5UthDLwaj4AE8aQqeT8
         RUOA==
X-Gm-Message-State: AO0yUKWAotMvkLZUpoj9ONkg0sR+bfT2WjPL+mo+OPgpUl1lkj5olXmh
	MQO7Ykob2MxTbmK2iuscUYRbn3KM2zw=
X-Google-Smtp-Source: AK7set988zUOPEqn4TkVkaUYPoBvug/eErlH7rGdBRWRxec5NZOC/O83RWRup2dzm+rGJooePAO5ZQ==
X-Received: by 2002:a5d:5306:0:b0:2c5:62c8:5f43 with SMTP id e6-20020a5d5306000000b002c562c85f43mr262102wrv.29.1676920472224;
        Mon, 20 Feb 2023 11:14:32 -0800 (PST)
Received: from Ansuel-xps. (93-34-91-73.ip49.fastwebnet.it. [93.34.91.73])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d4e0e000000b002c5a790e959sm4921331wrt.19.2023.02.20.11.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:14:31 -0800 (PST)
Message-ID: <63f3c697.5d0a0220.8f9f5.c859@mx.google.com>
X-Google-Original-Message-ID: <Y/N6yWyzhc12zhvD@Ansuel-xps.>
Date: Mon, 20 Feb 2023 14:51:05 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: fix SAC bug on peer addition with sta band
 migration
References: <20230209222622.1751-1-ansuelsmth@gmail.com>
 <167688346963.21606.5485334408823363188.kvalo@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167688346963.21606.5485334408823363188.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_111436_916026_ED6FC2CA 
X-CRM114-Status: GOOD (  12.69  )
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

On Mon, Feb 20, 2023 at 08:57:51AM +0000, Kalle Valo wrote:
> Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > Fix sleep in atomic context warning detected by Smatch static checker
> > analyzer.
> > 
> > Following the locking pattern for peer_rhash_add lock tbl_mtx_lock mutex
> > always even if sta is not transitioning to another band.
> > This is peer_add function and a more secure locking should not cause
> > performance regression.
> > 
> > Fixes: d673cb6fe6c0 ("wifi: ath11k: fix peer addition/deletion error on sta band migration")
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> I assume you only compile tested this and I'll add that to the commit log. It's
> always good to know how the patch was tested.
> 

Hi, I just got time to test this and works correctly on my Xiaomi
AX3600.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1

-- 
	Ansuel

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

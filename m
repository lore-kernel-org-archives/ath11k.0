Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DFBC71157
	for <ath11k@archiver.kernel.org>; Thu, 19 Jun 2025 03:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnfPabQqBz/ZwwVEOEty3CuDrAiHGUPnLiwc5VP0zZs=; b=Q1EEY7nUG2A1D3o/rTFIq7GRuM
	OsmU5DNDIzjqUjSlVSXhg++H+E4p+oSwjUB3vjz4OO+ZaITdBdV8x+Au0+g45G2P15D7RdBdPBgye
	QzMJFTngto4yxsm1+seGFZcv5TPU94IUnViZVDZ5z+Z8gDkb0nCtbLgA65V1RUPNktjKvsNujAKsk
	MOGhJnTKMu7gKMlIPooR+e1+6c8nCdJDtKntudR1rBBshaLD88hL9mBxqGjzTFIefn3zAS5AAfLa6
	Fb+jtZND3htGIuGe23pzfF/9mRhyhuh+iZkRIWuXsqMWC3dK1i5rqtddyEw7heUNGFNHSwWy9uEtX
	E4rmSgjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5Wb-0000000Brgt-1W1m;
	Thu, 19 Jun 2025 03:01:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5WW-0000000BrgX-0bON
	for ath11k@lists.infradead.org;
	Thu, 19 Jun 2025 03:01:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b31cd61b2a9so241127a12.3
        for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750302067; x=1750906867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cnfPabQqBz/ZwwVEOEty3CuDrAiHGUPnLiwc5VP0zZs=;
        b=UDMmU8YsDJOW08RFQpP9C2F2bgU21u7f+QcnGiLnhAwXeioMtCo/wBlXyVwjy3Qe56
         szmN32NcTbcH/VtFBYaFtj0S1DUziNhzytJ4XRPP57+kTrR7OG9p0vPQ9+pmLH45fRtC
         aomTVAABuWXzKAPtiTSYHXxsRaDJjwzaqgbW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750302067; x=1750906867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnfPabQqBz/ZwwVEOEty3CuDrAiHGUPnLiwc5VP0zZs=;
        b=YNW8aTxLvpeP+/Y5QGF51RCVE21UwlJgsWRwIwOd9gOOsvUixQZd3rOftWRqRajnLp
         sC3nHw0Cnx5oPywmwecCN2ANZtbA3wh9xDQ5v8h7NOZv5bk20/d5KQQHqK1JMecQHaO7
         g0pij1SXv0G4eY2bQo90u3NcBVdt9ynD9QV9YJrdWNIJT6nn6KqdZIeSc5jOPK1r5dop
         ilA3oDBWFJzwVKYBeZs+SlsPl82gXtxT9rsHq5b/2CozLbuxFXhm2RgsErjbuyDRZLm4
         2MGuw/JKwfpeLQR37485Ml+IoM/4EAAvPAPTu5tMOUKVaQZKHoH+o/+Z+DjZi8qL0qej
         vn3g==
X-Forwarded-Encrypted: i=1; AJvYcCVrRAENpX1Z9mti4KMlxpynwQX4ft4J2n1aMUWxloTrupE/g6rOAUPV0FsJMDAMQxF6TTH1Cxo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqijuNy/7olQ7AqZwIDvZf6nZh+m8AbACyjHV3I1icAAQLSeJa
	ICZBuXU/63XvRZNEK6tyaXtKWkRtiXlzbpp3uZ63i6FGfneySLe7YiAZ3QFpzIETS5hurvL8dNG
	R5bE=
X-Gm-Gg: ASbGncvSAzHq+xru2AIw1vUfTCVK02dIJNcnrQQ11modOI02rgaEzi/Xi2TF3K3/6dt
	3c3w7wv9DgLZdxaSuSu/F68GAkiVZwvZOks40UGKHvseN2sH6lZjurGOKsRkX+o0zUAXav8iaDI
	tuJtuCjNU2w2SaOyte46E1MDuf9kT3fan3L17Ujg/KESvdnFYKBQkhW0rBm0+x2PwyAe43s6m+n
	KJ6RlabLdhWjvlD34IuLPeDdza8zSODztzp/ZG79NfZou0xV/Yzewye6TM16JID0dNTZTWL4m+N
	c769Jt0W9mYt30PhIPAAdTXv7xYKuZA7h+eOPGp+/6GQqRdPRuKXwddQ1IzGrQZCQg==
X-Google-Smtp-Source: AGHT+IEM7nAOf6NgL5UzOu5mBdnBTlvzxMMg9oOfTzsT/78xvmOxaCy1R8U5WMF9AfzgN56JsY7oYQ==
X-Received: by 2002:a17:90b:1c04:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-313f1e1a908mr25449839a91.31.1750302067269;
        Wed, 18 Jun 2025 20:01:07 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226dedsm1017779a91.5.2025.06.18.20.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:01:06 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:01:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, 
	Baochen Qiang <quic_bqiang@quicinc.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-ID: <37vwemsh2v5pweyrw5yxiesz5ktwrp7lfvrej2i4xa3skaxrhr@f7iaggiztmmw>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
 <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_200108_202160_FC8B7284 
X-CRM114-Status: UNSURE (   5.90  )
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

On (25/06/19 11:53), Sergey Senozhatsky wrote:
> 
> If you are        with this, can you please pick it up?
             ^^^ fine


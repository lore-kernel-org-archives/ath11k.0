Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D47C4828F
	for <ath11k@archiver.kernel.org>; Wed,  7 Feb 2024 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aC49Pqt3TtKkwgpE6SNnOvyuGnAhZfa+RFxHrCgFXQ=; b=ypF+HLkid3fvqp5+2RahcA70P9
	xb8r3u1SNtxGnZA3Bva/ISvw/RbxWYmKHOEjkkwA9MnPcDvdc2O1hm33ZVu11ROQBfDnmANS1NNHH
	Fa2MzkG/ag0S96An3uPbqST9d2xM3M1rlgKSUJ/6KmFmYSgZyj1HI7inWUUhsb58QnkpJ6VzYjBxT
	McgYw7zb3lgp4RsfWtueNnu7zJVmqLzsoHaW8o4LGXDOEWxKiPWEF/J5GLOEigQ3eawtUAHeeOHzL
	TKubYtctirZ2GEOVzAv6/LuQbvoCqtzYdwrQ7gFDiswzh9rV8F8T6VHLnFw33bMZWP39APUJb1BYj
	dsYI67zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgMD-0000000AWcH-2LaL;
	Wed, 07 Feb 2024 11:44:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXgMB-0000000AWbH-1xIo
	for ath11k@lists.infradead.org;
	Wed, 07 Feb 2024 11:44:48 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a38392b9917so71756166b.1
        for <ath11k@lists.infradead.org>; Wed, 07 Feb 2024 03:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707306285; x=1707911085; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0aC49Pqt3TtKkwgpE6SNnOvyuGnAhZfa+RFxHrCgFXQ=;
        b=GKpr7ZlKo0dnh1710DLKE/q/rITY0qCVX+8gA8FsOSEMqN+06TBixQfsBxHix7kweG
         q6+dPKMnNiXhscoKBKiTSnEzkSLHz0/KBQ2TxzQ1DGH8wHimRhnPM8mrybjlAZTGcHHG
         GB8Os897KDF2ZY4dPFBa8kYTe9C/w3ar3X6lJywYXS99//3RbLMp0DH4IToU2RYTyFqz
         9Wo81nKZ89xGwyTEzHC/W3nqioSVdUuHgNEdiHDnSJx81EwqQixsR1ot27eJJyCJrSt2
         /z+O2xPMmtxo/aVq4LwWplfGFU8BRCU2+KDT9z+/0hYEnYW8ytb/JejQ9siPzKdZFeF7
         IfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707306285; x=1707911085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aC49Pqt3TtKkwgpE6SNnOvyuGnAhZfa+RFxHrCgFXQ=;
        b=p0A3nEnaHwxlxkzirGmgS6qbZBw0lN/j022ZkuGcqkD2RQD56Ry9QVm+MBQKz+AI6v
         Iu8Bwi0tV4HeFJPoHredQuGb1Sg3lww8yyDaBpOSFEuwvp7/cvsg6J4KtbsbGUdWFQzz
         jfH8w+l+q/f/VLFhFbR8/pZwYzZQ4j+JPFUtsVEE+rAnasngDHAjPJN1gSumDzgLL2vC
         LxySJe+LU/5wkAJKUpnQltk0MgWf1mwQI/f3i+sbbRV9ToWXWYsLW+vj5LWH883NGHZi
         kcON4RmPIBT71jjRETw3Vb0sQOi+28XDmQ8BckWnMUcl33Lj+wxM2R4lVr9JIYxMOmjP
         9bXA==
X-Gm-Message-State: AOJu0Yw2+WKJUPxmdP3rKdbR6RSrcCgSFhyexffJyOucOJcmjIH/84jk
	ipDwAsuJa+4x9VQ7JzSZKR7cnHW2CoKZq3dTmdMan4wXyqyzzBK2dYxf6uR65M0e9y1GlNy7JBH
	l
X-Google-Smtp-Source: AGHT+IFxQlDps8tzbi9cPGM96AP8pB9JnmI6QH8FdwUSxXKQqQOb9IMOwfW3V3MWtSfbt0F/eCV8GQ==
X-Received: by 2002:a17:907:7898:b0:a38:8d72:250f with SMTP id ku24-20020a170907789800b00a388d72250fmr499123ejc.44.1707306285121;
        Wed, 07 Feb 2024 03:44:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBT7pjXVXKaUXxJ4jzji12AfYT+hLy5DTWvkAwMMBSdn1Z7OKFxqmGZA93CUM6oy0RxazlTDPMy3+hv85Zg2zPvqXj4QB1sCM=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ld4-20020a170906f94400b00a37319aadb0sm677315ejb.15.2024.02.07.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 03:44:44 -0800 (PST)
Date: Wed, 7 Feb 2024 14:44:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Subject: Re: [bug report] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
Message-ID: <6297d546-f246-4306-ac9d-fc127960c157@moroto.mountain>
References: <14df3ef0-b86a-474e-b0b7-92f9bf434410@moroto.mountain>
 <875xz0qze2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xz0qze2.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_034447_537884_1A3C992E 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, Feb 07, 2024 at 01:36:53PM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
> > The patch 92425f788fee: "wifi: ath11k: fill parameters for vdev set
> > tpc power WMI command" from Jan 11, 2024 (linux-next), leads to the
> > following Smatch static checker warning:
> >
> > 	drivers/net/wireless/ath/ath11k/mac.c:7751 ath11k_mac_fill_reg_tpc_info()
> > 	error: uninitialized symbol 'eirp_power'.
> 
> Should be fixed by the commit below, right?
> 
> https://git.kernel.org/kvalo/ath/c/b82fb7ef690b
> 

Yeah.

I'm surprised that the kbuild bot reported that.  Normally, I sanity
check uninitialized variable warnings from kbuild bot.  I'm kind of glad
that I don't have to do that any more.

regards,
dan carpenter



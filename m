Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED637C48BF8
	for <ath11k@archiver.kernel.org>; Thu, 22 Feb 2024 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgiwPF0aDe9yj5CzJjlZKdJuiYIbrJDtCrpJLyrGsCk=; b=Rhbzx0AJxlAyWel6tUt9pIS8eC
	xaL/ZFy9JqV6bOs0rXUjL9X4IDi2Ph4vxQDuBtnbkM2xD4dEF0Bf7KzHWsDxT4sivRBC7eA7iSyvc
	RkuDUhee7IOHda1Zkx6QwY/5hKXJm23EsIgUW1cIHJiCwnlxNIIu2BuwL+OUg+pQc2eiX7RhWmyat
	K27E0/pdDe7/ZxvmorVeUdaGl9H3y+SgsU1DA6wLJAKJda8oczNMgpzdKt3dxyVd22sNuj33v+qKJ
	GAAzO2BBbtsfxptt3lXjN1kJziHlWdOe9Qh1vVnZy2B+oWsoJAgM1N11m6CLrFYg0l0Oubsauqj+T
	GFQAnzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdB9v-00000005QhJ-2aB0;
	Thu, 22 Feb 2024 15:38:51 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdB9s-00000005Qgb-1S4X
	for ath11k@lists.infradead.org;
	Thu, 22 Feb 2024 15:38:51 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso1515618a12.2
        for <ath11k@lists.infradead.org>; Thu, 22 Feb 2024 07:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708616327; x=1709221127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgiwPF0aDe9yj5CzJjlZKdJuiYIbrJDtCrpJLyrGsCk=;
        b=Da7+YsfrCqyGeSezjxwCQF2vbRWIVtTbHl4q16W+pMNARToFbQV2ySu706EscO+tAq
         Hv5HRMDqM0j2kuYiX2lWqxLFjKD0RvmXZJcPXPkw6JYuMYUxuNtmynYdD1UdwLERU6BJ
         nzcL6HKJ39Zs6PR1VzFJ+dK0l2xaApbEIYiBTbQyqfbxjCrce5UR9exg0Wp5Iz21NIWD
         US2VFkPzb8eT5OCtvvQPR0sejNb7t0+nHG9pPKtOPbySiWUPFYMgKswpx0Gcr/FfCU+e
         +KwRgjEDxD9i8R37uQ9tUX6WP/H3Xb6R4w82b0j1DBNAPPt/IDmgmb9wBMigcD2jqMF6
         DUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708616327; x=1709221127;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgiwPF0aDe9yj5CzJjlZKdJuiYIbrJDtCrpJLyrGsCk=;
        b=mOjrIpyGZpZ8keLKJZOUhGoyjpljHL/xRUiBhqnmeMEetLMkXhxxaY2luTWaX8ys7P
         C8lfcVYJRdbGXeKDg+rC79qf6kGuU4izHF2Utk3HgoxO426D26t8pwTqN1Ri77/ygcUf
         rP2cesu85C55Fr37vFM079vCxlkVaQZnnv3q9wCWp4fsGk2mkwrqAdCv7BdXOB7dqa5r
         s6cPZbQHP606oHXSZDQIq8VHlBk9k1GAdNHbjyIsZoj7ajCejxxVOwpX2XuA1pFrr4FX
         uG2rYi3o5crdqt39vJOThPVGVW4pUB/wjXQ6uvD/Om+82Xx2izegKUoZBXonyryqSDdP
         26LQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+P8IQumXOU1rcZoyLB8AKVVP0i6O75hV296N+IeNuC3J718NwviNRBdrkp/ZRlZXELsqUDft+OtcwSfvngvWkaZiupoDh2Oc/CQ==
X-Gm-Message-State: AOJu0YzuXrVIzo0QyiWI4zanYW9Tru4BUOMy1BcZQmsNqROQ1cZG706U
	QoEWzZHvhtd78U60GGU3nrmoYehzLu+5NEZ114u/bGaJEXVU4akZ
X-Google-Smtp-Source: AGHT+IE1VLtTaQqTb9bDv83/VhdyBtgAzckhiW9A65DY59qzo6Awfa/BtWlp5LxDbKF/i24C+Z1vjQ==
X-Received: by 2002:a05:6a21:3183:b0:19e:a9e6:c05 with SMTP id za3-20020a056a21318300b0019ea9e60c05mr26816890pzb.43.1708616326926;
        Thu, 22 Feb 2024 07:38:46 -0800 (PST)
Received: from [10.102.4.159] ([208.195.13.130])
        by smtp.gmail.com with ESMTPSA id e8-20020aa798c8000000b006e45a0101basm9302539pfm.99.2024.02.22.07.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 07:38:46 -0800 (PST)
Message-ID: <0e8ad2c2-cc39-4903-97f7-c3ffb525e61a@gmail.com>
Date: Thu, 22 Feb 2024 07:38:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
 "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>, ath11k@lists.infradead.org
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
 <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
 <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
 <eaeb8e9b-3809-4f89-a5b2-7949aa01fbde@gmail.com>
 <026d9ba3-525d-4a12-8d03-5fece818330c@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <026d9ba3-525d-4a12-8d03-5fece818330c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_073848_439322_852DB273 
X-CRM114-Status: UNSURE (   4.73  )
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

Hi Baochen,

On 2/21/24 6:26 PM, Baochen Qiang wrote:
> But you are using monitor mode, not station mode, on ath10k, right? 

No I'm using station mode. It looks like ath10k creates a monitor device 
to receive these frames (that was already done before my patch), but the 
interface I'm using from userspace is a regular station interface

Thanks,

James



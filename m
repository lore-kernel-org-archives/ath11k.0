Return-Path: <SRS0=n4Ib=PT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9635EC433EF
	for <ath11k@archiver.kernel.org>; Sun, 31 Oct 2021 07:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0976360E73
	for <ath11k@archiver.kernel.org>; Sun, 31 Oct 2021 07:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0976360E73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKsNVp/I7YWn3+O8GyhFAraUGgLa6+5HMx66qknW78o=; b=4sWiAuY6iuRTp1
	8CZHUP66F4ScRkSVtjNaTXCkBo8tULHEetJ5XXqiB3a7yWdLA/e+N7lSAaNqnkT1aQc3DlgP3nd50
	+sWVedLd3Q6g3RuNDeqEjgxK06aW/sshgErKgDIjvbDxcqcbXOYuzqvZ9oLQ5JviSb30JaOWuVL0X
	P7KHuqE7/2+vw0tXwbQ8F3AKrmNDXD+N4u85ty6A8KMTCeyppEvwRLzWekDR95ZVMJs8S9b1PXLdP
	tgLlyNyITZmfW0lVBespsk+aVNZAXiN80csxTqfEHWlrloR8E1BYJSm9UdkAwiER22Kr7aFcC5aTz
	wS+DhNr2KY8ldgWfNyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mh5Uw-00DkXs-2T; Sun, 31 Oct 2021 07:43:22 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mh5Uu-00DkXY-Ch
 for ath11k@lists.infradead.org; Sun, 31 Oct 2021 07:43:21 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bu18so12970479lfb.0
 for <ath11k@lists.infradead.org>; Sun, 31 Oct 2021 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=+6y2YAvOjBm6wucz96aycHU9dyp53pd+LDRwDzhkAQ8=;
 b=MP298zj2GXFJ3NxXwsdnQqbgr6mYaTBmQN6oMq3+UjPZvhw2GqcTE9DzASJYhwdVMz
 WpVfGjnBaiAMgyQ7mTeQXxJWSgiUsX8r3l3UWDoSQnZTwQ9L6HsreWqUTkVwf96PRf6E
 UUUMiS4X6M9tIsjA6yEQvWbfcv/3cboB+CQ55+Rlcr+unsZThZDnbkRCMWSV4O7sdIyX
 fAIq7b0UL5jmpMWqVhPttlhKZmxNIpa9Wb4f8CCAtnFgn4PHYgsXZBRDBqBnNBuHJYnB
 15WVXf644mYI+RXHKfRaEulQ5ghOopsoU2ZpuTAsdXMlwBEfpWGFeWS0IDrE/qhQdx0F
 4clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=+6y2YAvOjBm6wucz96aycHU9dyp53pd+LDRwDzhkAQ8=;
 b=ngjje9ulPjitoXkn74g4he4fdwi52lYNpHzPzWVv0+REFcW4fIHSUOh+X0BN37iDCv
 0YwJX11YYUbu4QUhZoirOXdU+9T2SuT8l8ENGaNZx/4WoVuAfCcFXQY+dOo2lq5a/I6T
 tSFTEeg9IU5PudgnX4GcgmKnNFnYZ3toBzLruXnR8u9YSSfkw+ALMtBMTAHv9h52jEDT
 SqmpjO6Kd43xN2HeoZn0k7HlrcGNZ8w90V62g8Jhdo0Zj/aaJ3P+W37F910YFx/8lbkD
 GHjcLMCfvkqaYj7MGlsS1b7SYzjPtpDgrLYBZr8LGGUAeXRt4L2C4IQ4FHkG1U1VMd9N
 FhBw==
X-Gm-Message-State: AOAM533YI885Br4n7aOmcHsKNNOFz8fkpTcU6QOW9aUJb7emePfc4xOO
 Z+hzOTEGfVZ74AMIBJZ6DBvvJdAPEfM=
X-Google-Smtp-Source: ABdhPJzrS9AQfSyVVh/GuCMVH9OFfT3iUqGitUNzrUw2oUT/JyVK4VxxwP42JFickdxqjgYcTEM5Bg==
X-Received: by 2002:a05:6512:3d0b:: with SMTP id
 d11mr6345623lfv.481.1635666198581; 
 Sun, 31 Oct 2021 00:43:18 -0700 (PDT)
Received: from ?IPv6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:5?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:5])
 by smtp.gmail.com with ESMTPSA id t13sm1101425lfc.34.2021.10.31.00.43.17
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 00:43:18 -0700 (PDT)
To: ath11k@lists.infradead.org
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: Re: Can not unload ath11k_pci and load it back
Message-ID: <cdeee5b3-a4c2-3ab1-b6bb-c9621fab3d2f@gmail.com>
Date: Sun, 31 Oct 2021 10:43:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_004320_472058_D65DAD86 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SSd2ZSBkb3duZ3JhZGVkIGZpcm13YXJlIHRvIHRoZSAKdmVyc2lvbsKgwqBXTEFOLkhTVC4xLjAu
MS0wMTIzMC1RQ0FIU1RTV1BMWl9WMl9UT19YODYtMQoKV0l0aCB0aGlzIGZpcm13YXJlIEkgYW0g
YWJsZSB0byBkbyBybW1vZCBhbmQgaW5zbW9kIHdpdGhvdXQgYW55IGlzc3VlLiAKQnV0IHN1c3Bl
bmQtcmVzdW1lIGRvZXMgbm90IHdvcmsgaWYgaSBkbyBub3QgZG8gcm1tb2QgYmVmb3JlIGdvaW5n
IHRvIApzdXNwZW5kIG9yIGhpYmVybmF0ZS4KCkJ1dCBmcm9tIHRoZSB1c2VycyBwb2ludCBvZiB2
aWV3IHRoaXMgY29uZmlnIGxvb2tzIGJldHRlciAtIG5vdCBhIGJpZyAKZGVhbCB0byBhdXRvbWF0
ZSBybW1vZC9tb2Rwcm9iZSBzZXF1ZW5jZSBvbiBzdXNwZW5kIHJlc3VtZSBhbmQgaGF2ZSBib3Ro
IApzdXNwZW5kIHRvIHJhbSBhbmQgc3VzcGVuZCB0byBkaXNrIHdvcmtpbmfCoCByYXRoZXIgdGhh
biBoYXZlIGJyaWxsaWFudCAKczJpZGxlIHN1cHBvcnQgYnV0IGNvbXBsZXRlbHkgYnJva2VuIGhp
YmVybmF0aW9uLgoKQW55d2F5IEkgaGF2ZSB3b3JrYXJvdW5kIGZvciBub3cgLSB0aWxsIHRoZSBp
c3N1ZSByb290IGlzIGZvdW5kLgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMWsK

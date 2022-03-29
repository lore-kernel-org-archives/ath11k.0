Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B257C433F5
	for <ath11k@archiver.kernel.org>; Tue, 29 Mar 2022 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hHFZKhUW1rS7orZKP78yhMbbsKpJayL53HZ5TOwLEXQ=; b=RcDkOswl6rO01y
	bZSjQeGWlaI1bEdI+Q20jbD4enkOwYe3E9vKMFPJN2+YL/rZEtlF2n2XTmWkCLsqqqaqKSVrWesxu
	t9GB71uIAmSvUpybEG3Bf3dT35LFPoQcJzJQ3ttwtNnbr1IFksAGp7EMDncQBl/tUMIRGeadwAos5
	+fcL5x1A9ki2kQiq/8p+VTbo4hg4X6ZzZTKYjB6Hpq2zEqSkZczCLw+azMY8/3U1wf3fmDiP0hFOz
	eXzg+arZXYndhWSPQ+DfKPiTpWhCn+u+Q6fT5udcv4R6HWxyA8UEAwVhtMKSFUcUENksSMbi3SML6
	oPJQkrBxlu1sYxvqvnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6xB-00BQaY-I3; Tue, 29 Mar 2022 08:11:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6x8-00BQZR-JM
 for ath11k@lists.infradead.org; Tue, 29 Mar 2022 08:11:48 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 17so22391499ljw.8
 for <ath11k@lists.infradead.org>; Tue, 29 Mar 2022 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:content-language:from
 :subject:content-transfer-encoding;
 bh=k4IY8eqc+ZCLQt2hp/laNy7jzCZZOwFa2WzJ8iwxcHw=;
 b=pnODGpI9HeG/iUdIfd6AwxNCSPpDARCJJHRNfTYVb39ctZ+LUtnEQSOEa/gH8b/iMP
 MC6SYSfKJm/3OYd7g6k8aClVGOhqWndOgAw+teY+ItpbB+DaNfgH0xWmnIkGau2GXC1e
 iVUytXO4wIDNH4NDwEqrpAWxDspQZnvOwoMfKt7pP0VvppSefz10cudAksbpwn8ZBVAj
 kNhDvlX7NkMsJO8eO4X2as+BJuTUv2W0SSL5vqqDjCmWAM7WZgSu3qmKkoCzd39458mC
 pUckg56U7O8j0ot1uJbmeT0cEklQuKHxDWCYv6NIE5utnPQbOaJCmnWi4I9Q7vPjKW4B
 KMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:from:subject:content-transfer-encoding;
 bh=k4IY8eqc+ZCLQt2hp/laNy7jzCZZOwFa2WzJ8iwxcHw=;
 b=jgBjGhZaVN4yBoxCMaTRxO15MiSiujOWEkCUOwyR3czllx+KcHXX9c7fcj3KsND+nd
 KR3OA207FlVqZlSlpSLNGydKYkVsmqnJXfXuOj0D5L/yU1hOfbWRoPIun0qgVpZUsoWn
 o9hBdeb9Z+mXa+deMmbbEwTmEuLTYI62L6zRuNPJdJoTXDQHBtiE+8462V0yno4D2rNz
 mk/gZVbxHBx9bN9dIMiqowGPzp+jLlscRlKwG+EJqsz4cFts2kmuejMAL9bkL9QkSkav
 mTkIAY4bobDWebzNkVwCTrlb2M9oZ1X2qJtdQiz85WKiP0RJ9i/JA1lRQBDMie+b4JBY
 9G3A==
X-Gm-Message-State: AOAM530Qimq2TcQ3WPoI3hhERTb3C/crW9USRz5l6ykGEFwcgorxW7sl
 ou3XPVTIXzmAZvoN7l1KJRK1bxvl3HXFlQ==
X-Google-Smtp-Source: ABdhPJyU49DJs+LU/j0+VJAY9ZsJ3w5+r4NmNMll76zOFsRg1LKvtT7ppLJyrrIvNE6bPzR+r+E+zQ==
X-Received: by 2002:a2e:a4d1:0:b0:249:8c9c:5ae0 with SMTP id
 p17-20020a2ea4d1000000b002498c9c5ae0mr1527195ljm.283.1648541504266; 
 Tue, 29 Mar 2022 01:11:44 -0700 (PDT)
Received: from ?IPV6:2a02:2168:88a0:5e00:a4c7:4ba3:4116:3?
 ([2a02:2168:88a0:5e00:a4c7:4ba3:4116:3])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a2e94d7000000b002498622f241sm2034513ljh.12.2022.03.29.01.11.43
 for <ath11k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 01:11:43 -0700 (PDT)
Message-ID: <a70aba8a-cce4-a84b-ea70-5761bde1cbe5@gmail.com>
Date: Tue, 29 Mar 2022 11:11:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
To: ath11k@lists.infradead.org
Content-Language: en-US
From: Mark Herbert <mark.herbert42@gmail.com>
Subject: QCA6390 power saving issue
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_011146_660726_2998DE13 
X-CRM114-Status: UNSURE (   7.99  )
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

SSByZW1lbWJlciB0aGVyZSB3YXMgYSBidWcgcHJldmVudGluZyBDUFUgZW50ZXJpbmcgdG8gZGVl
cCBwb3dlcnNhdmluZyAKc3RhdGVzIHNvIG9ubHkgUEMzIHdhcyByZWFjaGVkLgoKVGhlIGJ1dCBp
dHNlbGYgaXMgZml4ZWQgLSBidXQgSSBoYXZlIGp1c3Qgbm90aWNlZCBhIHNtYWxsIHJlbWFpbmlu
ZyAKaXNzdWUuIFdoZW4gSSBzdGFydCBteSBQQyBhbmQgdGhlcmUgaXMgbm8gV0lGSSB0aGF0IEkg
Y2FuIGNvbm5lY3Qgc28gCmF0aDExwqAgaXMgZW5hYmxlZCBidXQgbm90IGNvbm5lY3RlZCB0byBh
bnkgbmV0d29yayAtIGl0IMKgIHByZXZlbnRzIAplbnRlcmluZyBpbnRvIGRlZXAgUEMgc3RhdGVz
IGFnYWluLiBXaGVuIEkgY29ubmVjdCB0byB0aGUgV2lGaSBuZXR3b3JrIC0gCmRlZXAgUEMgc3Rh
dGVzIGJlY29tZSByZWFjaGFibGUgYWdhaW4uIEFuZCB3aGVuIEkgZGlzY29ubmVjdCBhZnRlciBm
aXJzdCAKY29ubmVjdGlvbsKgIGFuZCBrZWVwIG15IGF0aDExayBkaXNjb25uZWN0ZWQgKGV4YWN0
bHkgc2FtZSBzaXR1YXRpb24gYXMgCmltbWVkaWF0ZWx5IGFmdGVyIGJvb3QpLSB0aGVyZSBpcyBu
byBpc3N1ZS4KClNvIHNlZW1zIHRoYXQgdGhpcyBwb3dlcnNhdmluZyBmZWF0dXJlIGlzIG5vdCBh
Y3RpdmF0ZWQgb24gYm9vdCBidXQgb25seSAKYWN0aXZhdGVzIHdoZW4gdGhlIGNhcmQgY29ubmVj
dHMgdG8gYWNjZXNzIHBvaW50LsKgIEkgYW0gbm90IGdvb2QgZW5vdWdoIAppbiBkcml2ZXIgZGV2
ZWxvcG1lbnQgYW5kIGRlc2lnbiBhIGZpeCBteXNlbGYuIFNvIGp1c3Qgd3JpdGluZyBoZXJlCgoK
LS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK

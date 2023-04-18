Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25844C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDN7C8shReKCR20iFqQJdKvbpcCLulQMernSLRmnHAY=; b=ShtbQ7s/GdrcZr
	+AU/OgLzRpzcmf5yPWXRiMvPof5dpaL0MQzSOycaBSqTPdWDvyzQjFAwkoBPi/JvfiZ6uXUAyll3o
	A0Bm2AZV5sWchR/znQky/Ia/bMRaIzopv9R1fFw8Pao3gIblLQ4thE3V98nCwN5aSrcgoeyu/V0T1
	SfddvavU6dmZjF4Kgo3stieuKYBwlYe6abykJBq0tlND7WPDhdtUXucOTmDVXcN24JFx899uKBkS2
	p96NgZw39R8LuaQIXG2e9m5O/pzCOCmfP4YVPv8ImVuEIroU7vW1n8iyr6xASbmhnT8hMFE4NmW9a
	x3lE69JSqHJQbuiyMbsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohkZ-001Uyx-2b;
	Tue, 18 Apr 2023 09:35:47 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohkV-001Ux2-24
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:35:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5191796a483so1942568a12.0
        for <ath11k@lists.infradead.org>; Tue, 18 Apr 2023 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1681810540; x=1684402540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBHDCl6z6oJovCNvjDxh1E2Kytz5KU1DPO3cB3Y5kC0=;
        b=fKUc5CdJ8+Mf6CmHcxop0V6ygsM95+snoENlzGoMxP/PmCoyBq2UWqdZAXEgdQWZ19
         xy9T0EoLtQRAVXeK2lGY3XX6KcfjIsIbH1JytTlVADkIfh3glDlaSRdUUUBLxbdMqesP
         7a08kVSTxATmYiFAlTVYjDhk/dx7wk2rIwiy8i2NOpiEuNouQRgCUWpt3Ys+hv8Kia2b
         6rS7oPTXrM79GSV36v8TO/yxXXeTxG3u8jjgEkOWr/znZ04BJr4AQU4+Jxww/UuKIDb3
         D+pg785dBoPksnOg8xm4nwM3lwkz5NcWbjPAHIlCaCtIqJPdTe0wuEvdDKn1SEP4X9e0
         BCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681810540; x=1684402540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBHDCl6z6oJovCNvjDxh1E2Kytz5KU1DPO3cB3Y5kC0=;
        b=OtrsIR5Zmj9m/YAksSmjzWmuyv6KmFQy133ABvQfczpy/9a0LZJpnV1lG+0eEhbV5r
         ylHrVF+rHKj0/T7IlRH+00t9RALauMs+Aa4j/ZdNktfkyNKcDQPpyeseMBNsEoR0reyp
         VNhcS7N4VTs3i/I1k0JvmB+CITMMp+uT1JIeM7CmSJFo6UiMrTyAqDS6Vj3hVqmvatye
         m90ysJvSFFAjXFjazC+WSx4Y0BKQT/o5L2zdSsR4+0dXuCNYrh+SRLq/EK/ofs8gdB8c
         NwS5aSlEfj70LL6A9x9P1GZk+pSjXvOgsilJlws3Mdmr/R2yU0jbn/1VWjO/uXvpjni5
         s4MA==
X-Gm-Message-State: AAQBX9co75wk/JBR5IRcZT+djbDtKEXvdyt6VgQj1Q7L6Xx/TZlagK+3
	o3yyTS4vejshfmBNgDuOnqgisJNs7YDE6OSoyxmkESt6V/IqOoY2T54=
X-Google-Smtp-Source: AKy350bLgmod9zQU3mMT3TyLinWMqUG95Rh2K9AYMdWBVFTzdZvL9wg3Ril7H7BOthMpvnMS0UtF07YoHHXpAFfANAk=
X-Received: by 2002:a17:90b:1a92:b0:247:bab1:d901 with SMTP id
 ng18-20020a17090b1a9200b00247bab1d901mr1399753pjb.17.1681810540487; Tue, 18
 Apr 2023 02:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <1681762947-13882-1-git-send-email-quic_msinada@quicinc.com>
In-Reply-To: <1681762947-13882-1-git-send-email-quic_msinada@quicinc.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 18 Apr 2023 11:35:29 +0200
Message-ID: <CA+HBbNHB5dOgojaxm4RT_psrA8XQTt=4VubZ0xJv3HogDdMRig@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Remove disabling of 80+80 and 160 MHz
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	P Praneesh <quic_ppranees@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023543_681155_DBDDB610 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTA6MjPigK9QTSBNdW5hIFNpbmFkYSA8cXVpY19tc2lu
YWRhQHF1aWNpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgaXMgYSByZWdyZXNzaW9uIGZpeCBmb3Ig
ODArODAgYW5kIDE2MCBNSHogc3VwcG9ydCBiaXRzIGJlaW5nCj4gY2xlYXJlZCwgdGhlcmVmb3Jl
IG5vdCBhZHZlcmlzZWQuIFJlbW92ZSBkaXNhYmxlIG9mIDgwKzgwIGFuZCAxNjAgTUh6Cj4gY2Fw
YWJpbGl0eSBmbGFncyBhbmQgYXNzaWduIHZhbGlkIGNlbnRlciBmcmVxdWVuY3kgMiBzaW1pbGFy
IHRvCj4gVkhUODBfODAuCj4KPiBGaXhlczogMzhkZmU3NzVkMGFiICgid2lmaTogYXRoMTFrOiBw
dXNoIE1VLU1JTU8gcGFyYW1zIGZyb20gaG9zdGFwZCB0byBoYXJkd2FyZSIpCj4gUmVwb3J0ZWQt
Ynk6IFJvYmVydCBNYXJrbyA8cm9iZXJ0Lm1hcmtvQHNhcnR1cmEuaHI+Cj4gTGluazogaHR0cHM6
Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTcyOTkKPiBDby1kZXZlbG9w
ZWQtYnk6IFAgUHJhbmVlc2ggPHF1aWNfcHByYW5lZXNAcXVpY2luYy5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUCBQcmFuZWVzaCA8cXVpY19wcHJhbmVlc0BxdWljaW5jLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBNdW5hIFNpbmFkYSA8cXVpY19tc2luYWRhQHF1aWNpbmMuY29tPgo+IC0tLQoKVGVzdGVk
LWJ5OiBSb2JlcnQgTWFya28gPHJvYmVydC5tYXJrb0BzYXJ0dXJhLmhyPiAjSVBRODA3NApXTEFO
LkhLLjIuOS4wLjEtMDEzODUtUUNBSEtTV1BMX1NJTElDT05aLTEKClJlZ2FyZHMsClJvYmVydAot
LSAKUm9iZXJ0IE1hcmtvClN0YWZmIEVtYmVkZGVkIExpbnV4IEVuZ2luZWVyClNhcnR1cmEgTHRk
LgpMZW5kYXZza2EgdWxpY2EgMTZhCjEwMDAwIFphZ3JlYiwgQ3JvYXRpYQpFbWFpbDogcm9iZXJ0
Lm1hcmtvQHNhcnR1cmEuaHIKV2ViOiB3d3cuc2FydHVyYS5ocgoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK

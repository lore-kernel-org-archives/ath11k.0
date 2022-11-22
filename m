Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE8C4332F
	for <ath11k@archiver.kernel.org>; Tue, 22 Nov 2022 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KlguM1bKLnQv4IELDNuwLNGYn+nylDNvQMqrXkdVQM=; b=GuRLBsQJRHkOmJ
	HYb0A7cLgS9ydt+YYvqIN5oW0SUb8vzlmiIrORxBO2V1+iI/RViLxf7EiMfOEJoKrLrFg7f/ONAit
	USEWwdRqbbkXCx4RmMRSW8SlFhgaUx4Zqsy7LiBeZGyruGcG3zHhI5BLmxYGY3fB0kZJDdu/jfxSQ
	QM70lJo4zaOaC7tHo24ggulYM5GPn92p6ELGHFKQ+XHY7A/bFRoHZaompwDphjnG1MKgpNVLN8FRC
	I+dPX70RbogWiAbovrGxX9xwo7/rNDgw1CTtlrhjponA6geEz5cFSQw7YbrL/ZUGirBC4B3ep4tz7
	t758TXKjey+ygUXedP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUzB-00AFtB-Gz; Tue, 22 Nov 2022 15:14:57 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUz7-00AFpG-GB
	for ath11k@lists.infradead.org; Tue, 22 Nov 2022 15:14:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id r12so24060770lfp.1
        for <ath11k@lists.infradead.org>; Tue, 22 Nov 2022 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNMSbW46FbxzVR57kjOJZ411tMjsVP/XhMyoAAfaqrY=;
        b=iOhOSwfRou7i8BjfAdvtA3W6MpMGAzbUT3qP54rBFlByGgt9l/oArHosSF8DCIrfqq
         YjKS39OiY+DAftQ5vCva1z6VFhEAg6j2LTHnqXmIxAChxxDuSA6etmxTMOD54EhroAoe
         fya39avCvLnWjZAQUZTX4zMf/aPPC3nI9qXOhgkyQ825xBTWg3p8F3AM2GbGhVGeDNHS
         slesZzC3WqWrlGZlQ1zDyWCVSw4Bx/+IvlJWfznldGbr8ZYxhz5/cBbTKcyrgcGeffOY
         ofI+/ybH5awx/iK/nadNylOlPFS5dN3jzG4bWtbHSZBqqmhUI/Ct1WDSWy1xJw6OUuXM
         6gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNMSbW46FbxzVR57kjOJZ411tMjsVP/XhMyoAAfaqrY=;
        b=jtayPJnTxfIDvZTuZ03HNCYoESTk8JXNJVeXK2G+MWhmV5Z1+Vco7HQkTF2sCc2o25
         4j+VuF9U4ci7GGwWGqnJ30mAVu/gIJ4Nto/KVZwvGK7mIY51n6ggMlo6CF1SPbYihsCO
         vgtibobiclLHaUy8RZqmtJzqUTAJDShJ8ufzI10JBuV5EkBUm6DV2fRgyuZ2XhqzcFAt
         fPR/JgD/MjnjI5jK7Hjl4/MbdZMIa1vBP5YiacxsF2GgGHJO9RkAyP2aNsT91RiqdT6J
         K4sexzFoMGJUTHkuldnyDw67J2jwuIiaM40RUzseIvap15+VqhvLEBk8Q6Y9A7CAc/Bc
         k2DQ==
X-Gm-Message-State: ANoB5pkSyXSgqWDOh4Izxoqm3WfMp3e1VOrFRiRGUn0fV8c9ZoiYaCXi
	yb6Nt3+mvQ7XwUFRDf9pXMvQAIwpF7aFxK61PebNYQe6gbdc6Q==
X-Google-Smtp-Source: AA0mqf7meuCm7pVN4mb0GG4XtBUwraUMfYAKoRQMey/YDdwk6SVwzqYf6IKrhGSWO0xyhJ+4zpZzvoH8me8nCcPND2M=
X-Received: by 2002:a05:6512:6ca:b0:4a3:9533:cb25 with SMTP id
 u10-20020a05651206ca00b004a39533cb25mr7488558lff.442.1669130088603; Tue, 22
 Nov 2022 07:14:48 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
 <3684626.iIbC2pHGDl@sven-l14> <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
 <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com> <CAJrE-q41T-A0My_+wRauGW9CQh53U7CLP5L9vNNMKtS4nEvFgA@mail.gmail.com>
In-Reply-To: <CAJrE-q41T-A0My_+wRauGW9CQh53U7CLP5L9vNNMKtS4nEvFgA@mail.gmail.com>
From: Mariusz <enebeo@gmail.com>
Date: Tue, 22 Nov 2022 16:14:36 +0100
Message-ID: <CAJrE-q7qU=VaUEOaFwEq5MoAByR5eAqhA0_Py-O=CR55LEF_qQ@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Robert Marko <robert.marko@sartura.hr>
Cc: Sven Eckelmann <sven@narfation.org>, walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_071453_566677_646F8D39 
X-CRM114-Status: GOOD (  53.53  )
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

I finally got it to work! Performance wise it is not terrible and now
I am moving from driver perimeter to hostapd perimeter. Running stable
for the last 24hrs, no drops.
160Mhz width on channel 5, client reports 2402/2402 (Mbps) which is
max since intel AX210 is a 2 stream device versus 4 on QCN. In
practice with iperf3 between NAS & my PC connected to the SoftAP and 4
threads:

[SUM]   0.00-10.00  sec  1.13 GBytes   972 Mbits/sec                  sender
[SUM]   0.00-10.00  sec  1.13 GBytes   972 Mbits/sec                  receiver

1669065192.525964: Mode: IEEE 802.11a  Channel: 5  Frequency: 5975 MHz
1669065192.525965: nl80211: Set freq 5975 (ht_enabled=0,
vht_enabled=0, he_enabled=1, eht_enabled=0, bandwidth=160 MHz,
cf1=6025 MHz, cf2=0 MHz)

Not that it is specific to ath11k driver but in case anyone is looking
for some information getting it up required solving regulatory domain
issues, board_id issues and finally hostapd issues - maybe not issues
but considerations.

- First I got a list of channels off the internet wrongly listing PSC
channels as 1, 17 , 33 etc. Hostapd channel=0 with ACS was setting
channel 33 as optimal. I assumed this is a PSC channel wrongly.
Comparing live packet dumps from AXE75 and QCN9074 I started spotting
those nuances and a problem was already creating itself. As explained
this is a single band module so it does not have any 2.4/5G channels
to assist with broadcasting and 6E has only 1 active method of in-band
discovery - PSC. This made discovery tricky.
- Needed to update driver of AX210 to even discover commercial AXE75,
so also client required work.
- Then I compiled hostapd with FILS support but it is off by default.
You need to specify max_interval to turn it on which assists PSC with
passive discovery. fils_discovery_min_interval=20,
fils_discovery_max_interval=100. Yes, I understand we discourage use
of the 6E band for probing but if this is the only band it should be
on by default.
- op_class= it looks like you can set anything between 131-136, it has
meaning only to enable 6E but it does not preset channel/center
frequency or anything based on the channel number/PSC or not. I set
op_class=134 channel=5, he_oper_centr_freq_seg0_idx=15 (for 160Mhz)
and he_oper_chwidth=2 (chwidth can be anything, it is ignored). With
other 3 parameters set kernel is not reporting errors and AP is
functioning. Don't use ASC if you have a single band module due
in-band discovery issues.
- good thing it is working well in bridge mode incl. dhcp broadcasts
- in case anyone wonders, AP operates in US reg domain since firmware
still does not have proper lower 6E band support for EU, it disables
6E with iw reg set BE/DE or any non US country. Client is using LAR
and setting itself to BE. If you don't need DFS (not needed in 6E)
etc. country_code, ieee80211d don't need to be set. If you set it to
anything else than US you fail at start -> firmware does not have reg
domain for 6E in any other region than US. That consumed some time to
discover, understand and compilation of various kernel options for
self-managed setting.

So to conclude on this topic here likely most of the manufacturers of
these modules in China don't have tools/licenses for QCA
tools/software hence modules come not fused. Ask before you buy to
confirm. Likely mostly these are only PCB/assembly shops. I gave up
trying since support discussions were going nowhere. Secondly there's
been changes to 6E so some information out in the internet is not
accurate and greatly confusing between multi-band & single-band
scenarios. Most assume you work in a multi-band environment. Thirdly,
very early software/firmware with quite dynamic regulatory footprint -
expect differences to reality.

In any case working hostapd.conf for single band 6E which is now
discover-able in a reasonable time (20-30 seconds from AP start).

grep "^[^#]" hostapd.conf
interface=wlp1s0
bridge=br0
logger_syslog=-1
logger_syslog_level=0
logger_stdout=0
logger_stdout_level=0
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=XXXXXXX
hw_mode=a
channel=5
op_class=134
preamble=0
macaddr_acl=0
auth_algs=3
ignore_broadcast_ssid=0
ap_isolate=1
broadcast_deauth=0
ieee80211ax=1
he_oper_centr_freq_seg0_idx=15
he_6ghz_reg_pwr_type=0
eapol_key_index_workaround=0
eap_server=0
own_ip_addr=127.0.0.1
wpa=2
wpa_passphrase=XXXXXXXXX
wpa_psk_radius=0
wpa_key_mgmt=SAE
rsn_pairwise=CCMP
group_cipher=CCMP
wpa_group_rekey=1800
rsn_preauth=1
ieee80211w=2
group_mgmt_cipher=AES-128-CMAC
assoc_sa_query_max_timeout=10000
sae_pwe=2
fils_hlp_wait_time=30
fils_discovery_min_interval=20
fils_discovery_max_interval=100
proxy_arp=1
stationary_ap=1

On Sun, 20 Nov 2022 at 09:13, Mariusz <enebeo@gmail.com> wrote:
>
> I also got my hands on AXE75 which is a 6E router and I am able to get
> QCN9074 work in STA mode.
>
> With 160Mhz it did not work but it may be anything. However with 80Mhz
> I am able to get a successful connection fully authenticated with
> WPA3. So radio wise it operates in 6Ghz band after driver patch with
> board_id=0xa2. Now I'm trying to understand why it still does not work
> in AP mode.
>
> root@s4:/home/angel# wpa_cli status
> Selected interface 'wlp6s0'
> bssid=1c:61:b4:c8:93:f4
> freq=6115
> ssid=test
> id=0
> mode=station
> wifi_generation=6
> pairwise_cipher=CCMP
> group_cipher=CCMP
> key_mgmt=SAE
> pmf=2
> mgmt_group_cipher=BIP
> wpa_state=COMPLETED
> ip_address=192.168.6.123
> address=c4:4b:d1:d0:00:7e
> uuid=07aaca38-a259-53ef-b12b-bb4cf5dad8d8
>
> On Sat, 19 Nov 2022 at 16:16, Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > On Sat, Nov 19, 2022 at 2:40 PM Mariusz <enebeo@gmail.com> wrote:
> > >
> > > I have contacted Wallys again but I am skeptical about resolution.
> > > They don't consider board_id an issue and provided the same response,
> > > on integrated systems it is due the bootloader to set it properly so
> > > it is not fused and obviously not included in x86 scenario.
> >
> > Hi, this is not really the case, how would the bootloader set the board_id
> > which is supposed to be fused on the device so FW would report the correct one?
> > You can only workaround that by hardcoding it in the driver or on non-x86
> > in DTS and force-loading the correct BDF that way.
> >
> > > Since this
> > > is a private project I doubt QCA will support my efforts and free
> > > access to their portals gives nothing. Found online some SDK for
> > > version ath10k/IPQ8074 and athtestcmd to deal with OTP/fusing but
> > > that's far beyond home project effort.
> > >
> > > Tried also to compile it in OpenWRT with moderate success. ath11ko /
> > > qrtr.ko modules are built but the module never goes past power on
> > > success.
> > > mhi mhi0: Requested to power ON
> > > mhi mhi0: Power on setup success
> > > mhi mhi0: Wait for device to enter SBL or Mission mode
> > >
> > > Even the newest kernel in OpenWRT master development branch 5.16 is
> > > quite behind and backporting anything is another non-trivial task.
> >
> > ath11k won't work in OpenWrt master currently, I have been supporting IPQ807x
> > and recently PCI version as well out-of-tree with hopes of getting it soon into
> > OpenWrt once 6.1 backports become available as that gets rid of like 300-ish
> > backported patches.
> >
> > Regards,
> > Robert
> > >
> > > On Fri, 18 Nov 2022 at 15:06, Sven Eckelmann <sven@narfation.org> wrote:
> > > >
> > > > On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> > > > > Mine is from a different supplier - Wallys - and I bought it 2 weeks
> > > > > ago but not sure how old their stock is. PCB looks slightly different
> > > > > than Pinapple's. Is it likely to have the same issue?
> > > >
> > > > It definitely has the same issue (because you reported that board_id is
> > > > 255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was
> > > > never in contact about this problem with them. But sending around precompiled
> > > > kernel module binaries (for an unknown kernel build), with some hacks to fix
> > > > their hardware production errors (missing module id fusing in the OTP for
> > > > their separately sold modules), doesn't make me confident that they are able
> > > > to solve this problem correctly.
> > > >
> > > > In their defense, QCA doesn't make it really easy. It seems like their
> > > > reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs
> > > > which use the normal flash (NOR or NAND) to store the calibration data. And
> > > > for these devices, they use the devicetree (or various other hacks) to load
> > > > the correct board data.
> > > >
> > > > Wallystech has to find the correct document on createpoint which describes the
> > > > process. It was something like "module" "board id" "fusing". But it is not the
> > > > "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way
> > > > how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> > > > You/they are searching for the corresponding document for Pine IPQ9074. Most
> > > > likely hidden in some QDART documents.
> > > >
> > > >
> > > > Regarding the problem that some countries are not allowing 6GHz: You have to
> > > > either get a firmware from QCA which has it enabled or you modify the BDFs
> > > > ("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded
> > > > REGDB of the BDFs for the specific country. Unfortunately, the data structures
> > > > of the BDF are not officially documented and you would need an official QSDK/
> > > > ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the
> > > > corresponding template for your BDF to extract and modify it.
> > > >
> > > > Kind regards,
> > > >         Sven
> > >
> > > --
> > > ath11k mailing list
> > > ath11k@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/ath11k
> >
> >
> >
> > --
> > Robert Marko
> > Staff Embedded Linux Engineer
> > Sartura Ltd.
> > Lendavska ulica 16a
> > 10000 Zagreb, Croatia
> > Email: robert.marko@sartura.hr
> > Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

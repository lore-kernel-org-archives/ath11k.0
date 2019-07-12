Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <06c7c1a2c8d0f955cb107475d17587c156fb19de.camel@sipsolutions.net>
Subject: Re: [PATCH v3 0/3] mac80211/ath11k: HE mesh support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 12 Jul 2019 09:58:50 +0200
In-Reply-To: <1610842.TRhm9evnVP@bentobox>
References: <20190612193510.29489-1-sven@narfation.org>
 <c025150aad17bbe62595c4969ea2f53f009419d3.camel@sipsolutions.net>
 <1610842.TRhm9evnVP@bentobox>
Mime-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>
Cc: hostap@lists.infradead.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Wed, 2019-07-03 at 11:23 +0200, Sven Eckelmann wrote:
> 
>     ~/tmp/wireshark/build/run/tshark -r /tmp/hwsim-test-logs/latest/wpas_mesh_max_peering.hwsim0.pcapng  -T fields -e wlan.sa -e wlan.mesh.config.cap 'wlan.fc.type_subtype == 8' 
>     02:00:00:00:01:00       0x00000009
>     02:00:00:00:00:00       0x00000009
>     02:00:00:00:01:00       0x00000009
>     02:00:00:00:02:00       0x00000009
>     02:00:00:00:00:00       0x00000008
>     02:00:00:00:01:00       0x00000009
>     02:00:00:00:02:00       0x00000009
>     02:00:00:00:00:00       0x00000008
> 
> With wireshark 3.0.0:
> 
>     tshark -r /tmp/hwsim-test-logs/latest/wpas_mesh_max_peering.hwsim0.pcapng  -T fields -e wlan.sa -e wlan.mesh.config.cap 'wlan.fc.type_subtype == 8' 
>     02:00:00:00:01:00       0x00000001
>     02:00:00:00:00:00       0x00000001
>     02:00:00:00:01:00       0x00000001
>     02:00:00:00:00:00       0x00000001
>     02:00:00:00:02:00       0x00000001
>     02:00:00:00:01:00       0x00000001
>     02:00:00:00:02:00       0x00000001
>     02:00:00:00:00:00       0x00000001
> 
> So I had to change the wireshark version (see below) which is used by hostapd.
> (just to document for me what I have forced it to a different version)

What. +hostap list.

This makes no sense, is that a tshark bug in one of the versions?

Maybe we should just use the JSON output, and parse that, but if tshark
now has a different idea of what the "wlan.mesh.config.cap" field is,
that won't help us at all?

Older versions were misparsing the HE element, but that has a length so
should only affect the HE element *itself*?


So ultimately, what do we do here?

Should we take this and sort out the tests?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
